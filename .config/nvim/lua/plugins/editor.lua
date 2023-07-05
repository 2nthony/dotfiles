local skip_features_filetypes = require("util.ft").skip_features_filetypes

return {
  { import = "lazyvim.plugins.extras.editor.mini-files" },
  { import = "plugins.extras.editor.flash" },

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
          always_show = {
            ".env",
          },
        },
      },
      window = {
        width = 35,
        mappings = {
          ["s"] = "",
          ["S"] = "",
          ["<C-x>"] = "",
          ["o"] = "open",
          ["<cr>"] = "open",
          ["<C-s>"] = "open_split",
          ["<C-v>"] = "open_vsplit",
          ["<C-f>"] = "clear_filter",
          ["g?"] = "show_help",
          ["/"] = "", -- default search down
          ["?"] = "", --default search above
        },
      },
    },
  },

  {
    "RRethy/vim-illuminate",
    opts = {
      filetypes_denylist = skip_features_filetypes,
    },
  },
}
