-- git
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
  config = {
    enhanced_diff_hl = true,
  },
}
