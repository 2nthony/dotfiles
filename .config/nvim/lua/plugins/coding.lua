local icons = require("config.icons")
local icons_ui = icons.get("ui")
local icons_kinds = icons.get("kinds")

return {
  -- cmp
  { import = "plugins.extras.coding.supertab" },
  { import = "plugins.extras.coding.esc-unlink-snippet" },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter" },
    dependencies = {
      "onsails/lspkind.nvim",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
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

      opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()
      opts.mapping["<C-j>"] = cmp.mapping.select_next_item()

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
  {
    "hrsh7th/cmp-cmdline",
    lazy = true,
    event = { "CmdlineEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = {
      completion = {
        completeopt = "menu,menuone,noselect",
      },
      types = {
        {
          type = ":",
          sources = {
            { name = "path" },
            { name = "cmdline" },
          },
        },
        {
          type = { "/", "?" },
          sources = {
            { name = "buffer" },
          },
        },
      },
    },
    config = function(_, opts)
      local cmp = require("cmp")

      for _, opt in ipairs(opts.types) do
        cmp.setup.cmdline(opt.type, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources(opt.sources),
          completion = opts.completion,
        })
      end
    end,
  },

  -- codeium
  -- https://github.com/jcdickinson/codeium.nvim
  {
    "jcdickinson/codeium.nvim",
    lazy = true,
    event = { "InsertEnter" },
    init = function()
      require("util.cmp").duplicates.codeium = 0
    end,
    dependencies = {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        table.insert(opts.sources, 1, { name = "codeium", group_index = 1 })
      end,
    },
  },
}
