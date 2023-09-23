local skip_features_filetypes = require("util.ft").skip_features_filetypes

return {
  { import = "lazyvim.plugins.extras.editor.mini-files" },

  { "echasnovski/mini.bufremove", enabled = false },

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
    "folke/flash.nvim",
    vscode = true,
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        -- disable flit, I use `f` for search/find
        char = {
          enabled = false,
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

  {
    "abecodes/tabout.nvim",
    events = { "VeryLazy" },
    opts = {},
  },
}
