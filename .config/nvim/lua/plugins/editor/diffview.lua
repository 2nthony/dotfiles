-- https://github.com/sindrets/diffview.nvim

return {
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
    local icons = require("lazyvim.config").icons
    local keymap_q_close = { "n", "q", ":DiffviewClose<cr>", { desc = "Diffview Close" } }

    return {
      enhanced_diff_hl = true,
      icons = {
        folder_closed = icons.ui.Folder,
        folder_open = icons.ui.FolderOpen,
      },
      signs = {
        fold_closed = icons.ui.ChevronRight,
        fold_open = icons.ui.ChevronDown,
        done = icons.ui.Check,
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
}
