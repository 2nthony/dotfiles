local float = require("util.opts").float
local icons = require("config.icons")
local icons_ui = icons.get("ui")
local icons_ui_space = icons.get("ui", { "space" })
local icons_diagnostics_space = icons.get("diagnostics", { "space" })

return {
  { "echasnovski/mini.bufremove", enabled = false },
  { "ggandor/flit.nvim", enabled = false },

  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewLog",
      "DiffviewRefresh",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
    opts = function()
      local keymap_q_close = { "n", "q", ":DiffviewClose<cr>", { desc = "Diffview Close" } }

      return {
        enhanced_diff_hl = true,
        icons = {
          folder_closed = icons_ui.Folder,
          folder_open = icons_ui.FolderOpened,
        },
        signs = {
          fold_closed = icons_ui.ChevronRight,
          fold_open = icons_ui.ChevronDown,
          done = icons_ui.Check,
        },
        keymaps = {
          view = {
            keymap_q_close,
          },
          file_panel = {
            keymap_q_close,
          },
          file_history_panel = {
            keymap_q_close,
          },
        },
      }
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    cmd = { "Gitsigns" },
    opts = {
      current_line_blame = true,
      preview_config = {
        border = float.border,
        style = float.style,
      },
    },
  },

  {
    "ggandor/leap.nvim",
    opts = {
      highlight_unlabeled_phase_one_targets = true,
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    cmd = "Neotree",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = {
            ".git",
          },
          never_show = {
            ".DS_Store",
          },
        },
      },
      window = {
        width = 35,
        mappings = {
          ["s"] = "",
          ["S"] = "",
          ["<C-x>"] = "",
          -- ["o"] = "open",
          -- ["<cr>"] = "open",
          -- ["<C-s>"] = "open_split",
          -- ["<C-v>"] = "open_vsplit",
          ["o"] = "open_with_window_picker",
          ["<cr>"] = "open_with_window_picker",
          ["<C-s>"] = "split_with_window_picker",
          ["<C-v>"] = "vsplit_with_window_picker",
          ["<C-f>"] = "clear_filter",
          ["g?"] = "show_help",
          ["/"] = "", -- default search down
          ["?"] = "", --default search above
        },
      },
      default_component_configs = {
        indent = {
          expander_collapsed = icons_ui.ChevronRight,
          expander_expanded = icons_ui.ChevronDown,
        },
        icon = {
          folder_closed = icons_ui.Folder,
          folder_open = icons_ui.FolderOpened,
          folder_empty = icons_ui.FolderOpened,
          default = icons_ui.Text,
        },
        git_status = {
          symbols = icons.get("git_symbol", { "lower_case" }),
        },
      },
    },
    dependencies = {
      -- https://github.com/s1n7ax/nvim-window-picker
      {
        "s1n7ax/nvim-window-picker",
        opts = {
          autoselect_one = true,
          include_current = false,
          filter_rules = {
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { "neo-tree", "neo-tree-popup", "notify" },

              -- if the buffer type is one of following, the window will be ignored
              buftype = { "terminal", "quickfix" },
            },
          },
        },
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        FIX = {
          icon = icons_ui_space.Bug,
        },
        TODO = {
          icon = icons_ui_space.Check,
        },
        HACK = {
          icon = icons_ui_space.Skull,
        },
        WARN = {
          icon = icons_diagnostics_space.Warn,
        },
        PERF = {
          icon = icons_ui_space.Dashboard,
        },
        NOTE = {
          icon = icons_ui_space.Comment,
        },
        TEST = {
          icon = icons_ui_space.Beaker,
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      window = {
        border = float.border,
        winblend = float.winblend,
      },
    },
  },

  {
    "RRethy/vim-illuminate",
    opts = {
      filetypes_denylist = {
        "",
        "toggleterm",
        "OverseerList",
        "OverseerForm",
      },
    },
  },
}
