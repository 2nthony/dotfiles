vim.opt.completeopt={'menu', 'menuone', 'noselect'}

local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
  return
end
local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load() -- load freindly-snippets

cmp_config = {
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  completion = {
    ---@usage The minimum length of a word to complete on.
    keyword_length = 1,
  },
  formatting = {
    max_width = 0,
    kind_icons = {
      Class = " ",
      Color = " ",
      Constant = "ﲀ ",
      Constructor = " ",
      Enum = "練 ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = " ",
      Interface = "ﰮ ",
      Keyword = " ",
      Method = " ",
      Module = " ",
      Operator = " ",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      Struct = " ",
      Text = " ",
      TypeParameter = " ",
      Unit = "塞 ",
      Value = " ",
      Variable = " ",
    },
    source_names = {
      nvim_lsp = "(LSP)",
      copilot = "(Copilot)",
      treesitter = "(TS)",
      emoji = "(Emoji)",
      path = "(Path)",
      calc = "(Calc)",
      luasnip = "(Snippet)",
      buffer = "(Buffer)",
      spell = "(Spell)",
    },
    duplicates = {
      buffer = 1,
      path = 1,
      nvim_lsp = 0,
      luasnip = 1,
    },
    duplicates_default = 0,
    format = function(entry, vim_item)
      local max_width = cmp_config.formatting.max_width
      if max_width ~= 0 and #vim_item.abbr > max_width then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
      end
      vim_item.kind = cmp_config.formatting.kind_icons[vim_item.kind]
      vim_item.menu = cmp_config.formatting.source_names[entry.source.name]
      vim_item.dup = cmp_config.formatting.duplicates[entry.source.name]
          or cmp_config.formatting.duplicates_default
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "copilot" },
    { name = "path" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "spell" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "crates" },
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-f>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<esc>"] = cmp.mapping(function(callback)
      luasnip.unlink_current()
      callback() -- NOTE: CAN NOT delete this `callback`
    end, {
      "i",
      "s"
    }),
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   if luasnip.in_snippet() and luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   elseif cmp.visible() then
    --     cmp.select_next_item()
    --   else
    --     fallback()
    --   end
    -- end, {
    --   "i",
    --   "s",
    -- }),
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if luasnip.in_snippet() and luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   elseif cmp.visible() then
    --     cmp.select_prev_item()
    --   else
    --     fallback()
    --   end
    -- end, {
    --   "i",
    --   "s",
    -- }),

    ["<C-p>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false
    }),
    -- ["<CR>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() and cmp.confirm(cmp_config.confirm_opts) then
    --     -- if luasnip.jumpable(1) then
    --     --   luasnip.jump(1)
    --     -- end
    --     return
    --   end

    --   -- if luasnip.jumpable(1) then
    --   --   if not luasnip.jump(1) then
    --   --     fallback()
    --   --   end
    --   -- else
    --     fallback()
    --   -- end
    -- end),
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

-- disable autocompletion for guihua
vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")

cmp.setup(cmp_config)
