-- https://github.com/hrsh7th/nvim-cmp
-- https://www.lazyvim.org/plugins/coding#nvim-cmp
local icons = require("config.icons")
local icons_ui = icons.get("ui")
local icons_kinds = icons.get("kinds")

return {
  {
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
      local float = require("util.opts").float
      local win = require("util.opts").win
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

      opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()
      opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
      -- if back to normal mode, then unlink snippet action
      opts.mapping["<esc>"] = cmp.mapping(function(callback)
        if luasnip.in_snippet() then
          luasnip.unlink_current()
        end

        callback()
      end, { "i", "s" })

      opts.formatting.fields = { "kind", "abbr", "menu" }
      opts.formatting.format = lspkind.cmp_format({
        mode = "text",
        maxwidth = formatting.max_width,
        symbol_map = icons_kinds,
        ellipsis_char = icons_ui.Ellipsis,
        before = function(entry, vim_item)
          vim_item.dup = duplicates[entry.source.name] or duplicates.default

          -- required. check if `symbolic` able
          if lspkind.symbolic(vim_item.kind):len() > 0 then
            vim_item.kind = lspkind.symbolic(vim_item.kind)
          end

          return vim_item
        end,
      })
      return opts
    end,
  },
}
