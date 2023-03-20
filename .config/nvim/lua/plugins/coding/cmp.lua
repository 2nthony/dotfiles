-- https://github.com/hrsh7th/nvim-cmp
-- https://www.lazyvim.org/plugins/coding#nvim-cmp

return {
  "hrsh7th/nvim-cmp",
  lazy = true,
  event = { "InsertEnter" },
  dependencies = {
    "onsails/lspkind.nvim",
  },
  opts = function(_, opts)
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local icons = require("lazyvim.config").icons
    local float = require("util.opts").float
    local win = require("util.opts").win
    local format_tailwindcss_color = require("util.cmp").format_taiwlindcss_color
    local duplicates = require("util.cmp").duplicates
    local formatting = require("util.cmp").formatting

    local win_bordered = cmp.config.window.bordered({
      border = float.border,
      winhighlight = win.winhighlight,
    })
    opts.window = {
      completion = win_bordered,
      documentation = win_bordered,
    }

    opts.completion.keyword_length = 1

    opts.confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }

    -- reset
    opts.mapping["<C-space>"] = {}
    opts.mapping["<C-b>"] = {}
    opts.mapping["<C-p>"] = {}
    opts.mapping["<C-n>"] = {}
    opts.mapping["<C-f>"] = {}

    opts.mapping["<C-u>"] = cmp.mapping.scroll_docs(-4)
    opts.mapping["<C-d>"] = cmp.mapping.scroll_docs(4)
    opts.mapping["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
    opts.mapping["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })
    opts.mapping["<Tab>"] = opts.mapping["<CR>"] or opts.mapping["<cr>"]
    -- if back to normal mode, then unlink snippet action
    opts.mapping["<esc>"] = cmp.mapping(function(callback)
      if luasnip.in_snippet() then
        luasnip.unlink_current()
      end

      -- NOTE: CAN NOT delete this `callback`
      callback()
    end, { "i", "s" })

    opts.formatting.fields = { "kind", "abbr", "menu" }
    opts.formatting.format = lspkind.cmp_format({
      mode = "text",
      maxwidth = formatting.max_width,
      symbol_map = icons.kinds,
      ellipsis_char = icons.ui.Ellipsis,
      before = function(entry, vim_item)
        if vim_item.kind == "Codeium" then
          vim_item.kind_hl_group = "CmpItemKindCodeium"
        end

        vim_item.dup = duplicates[entry.source.name] or duplicates.default

        vim_item = format_tailwindcss_color(entry, vim_item, lspkind)

        return vim_item
      end,
    })
    return opts
  end,
}
