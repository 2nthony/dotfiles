local icons = require("config.icons")
local ui = icons.get("ui")
local kinds = icons.get("kinds")
local diagnostics_space = icons.get("diagnostics", { "space" })
local git_space = icons.get("git", { "space" })
local kinds_space = icons.get("kinds", { "space" })
local ui_space = icons.get("ui", { "space" })
local git_symbols_lower = icons.get("git_symbol", { "lower_case" })
local diagnostics_lower_space = icons.get("diagnostics", { "lower_case", "space" })
local misc_space = icons.get("misc", { "space" })

return {
  {
    "LazyVim",
    opts = {
      icons = {
        diagnostics = diagnostics_space,
        git = git_space,
        kinds = kinds_space,
      },
    },
  },
  {
    "nvim-cmp",
    opts = function(_, opts)
      local lspkind = require("lspkind")
      local formatting = require("util.cmp").formatting
      local duplicates = require("util.cmp").duplicates

      -- vscode like
      opts.formatting.fields = { "kind", "abbr", "menu" }
      opts.formatting.format = lspkind.cmp_format({
        mode = "text",
        maxwidth = formatting.max_width,
        symbol_map = kinds,
        ellipsis_char = ui.Ellipsis,
        before = function(entry, vim_item)
          vim_item.dup = duplicates[entry.source.name] or duplicates.default

          -- required. check if `symbolic` able
          if lspkind.symbolic(vim_item.kind):len() > 0 then
            vim_item.kind = lspkind.symbolic(vim_item.kind)
          end

          return vim_item
        end,
      })
    end,
    dependencies = {
      "onsails/lspkind.nvim",
    },
  },
  {
    "neo-tree.nvim",
    opts = {
      default_component_configs = {
        indent = {
          expander_collapsed = ui.ChevronRight,
          expander_expanded = ui.ChevronDown,
        },
        icon = {
          folder_closed = ui.Folder,
          folder_open = ui.FolderOpened,
          folder_empty = ui.FolderOpened,
          default = ui.Text,
        },
        git_status = {
          symbols = git_symbols_lower,
        },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        FIX = {
          icon = ui_space.Bug,
        },
        TODO = {
          icon = ui_space.Check,
        },
        HACK = {
          icon = ui_space.Skull,
        },
        WARN = {
          icon = diagnostics_space.Warn,
        },
        PERF = {
          icon = ui_space.Dashboard,
        },
        NOTE = {
          icon = ui_space.Comment,
        },
        TEST = {
          icon = ui_space.Beaker,
        },
      },
    },
  },
  {
    "nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          prefix = ui.CircleFilled,
        },
      },
    },
  },
  {
    "lspsaga.nvim",
    opts = {
      ui = {
        expand = ui.ChevronRight,
        collapse = ui.ChevronDown,
        kind = {
          ["Array"] = { kinds_space.Array, "Type" },
          ["Function"] = { kinds_space.Function, "Function" },
          ["Interface"] = { kinds_space.Interface, "Interface" },
          ["Object"] = { kinds_space.Object, "Type" },
          ["Folder"] = { ui.FolderOpened .. " ", "Folder" },
          ["String"] = { kinds_space.String, "String" },
        },
      },
    },
  },
  {
    "telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = ui_space.Telescope,
        selection_caret = ui_space.ChevronRight,
      },
      pickers = {
        git_status = {
          git_icons = git_symbols_lower,
        },
      },
    },
  },
  {
    "bufferline.nvim",
    opts = {
      options = {
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with({ icon = ui.Pinned }),
          },
        },
      },
    },
  },
  {
    "lualine.nvim",
    opts = function(_, opts)
      local diagnostics = {
        "diagnostics",
        symbols = diagnostics_lower_space,
      }

      opts.sections.lualine_c[1] = diagnostics
    end,
  },
  {
    "noice.nvim",
    opts = {
      cmdline = {
        format = {
          search_down = {
            icon = ui_space.Search .. "",
          },
          search_up = {
            icon = ui_space.Search .. "",
          },
        },
      },
    },
  },
}
