local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
  return
end
local status_luasnip_ok, luasnip = pcall(require, "luasnip")

local lspkind = require"lspkind"

if status_luasnip_ok then
  require("luasnip.loaders.from_vscode").lazy_load() -- load freindly-snippets
end

local cmp_config = {
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  formatting = {
    format = function (entry, vim_item)
      if entry.source.name == "copilot" then
        vim_item.kind = ""
        vim_item.kind_hl_group = "CmpItemKindCopilot"
        return vim_item
      end

      return lspkind.cmp_format({ with_text = false, maxwidth = 50 })(entry, vim_item)
    end
  },
  snippet = {
    expand = function(args)
      if status_luasnip_ok then
        luasnip.lsp_expand(args.body)
      end
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    -- Copilot Source
    { name = "copilot", group_index = 2 },
    -- Other Sources
    { name = "nvim_lsp", group_index = 2 },
    { name = "path", group_index = 2 },
    { name = "luasnip", group_index = 2 },
  }),
  mapping = cmp.mapping.preset.insert {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-f>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<esc>"] = cmp.mapping(function(callback)
      if status_luasnip_ok then
        luasnip.unlink_current()
      end

      callback() -- NOTE: CAN NOT delete this `callback`
    end, {
      "i",
      "s"
    }),
    ["<C-m>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false
    }),
  },
}
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline('?', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'cmdline' }
  }, {
    { name = 'path' }
  })
})

cmp.setup(cmp_config)
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
