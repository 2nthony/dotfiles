-- https://github.com/sindrets/diffview.nvim
local icons = require("config.icons")
local icons_ui = icons.get("ui")

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
}
