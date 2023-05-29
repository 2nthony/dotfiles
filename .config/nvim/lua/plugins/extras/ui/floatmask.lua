-- craftzdog like
-- background transparent, but popup(float) like a mask without border

return {
  {
    "vitesse.nvim",
    opts = {
      -- transparent_background = false,
      transparent_float_background = false,
      telescope_border_follow_float_background = true,
    },
  },

  -- editor
  {
    "gitsigns.nvim",
    opts = {
      preview_config = {
        border = "none",
      },
    },
  },

  -- dap
  {
    "overseer.nvim",
    opts = {
      form = {
        border = "none",
      },
      confirm = {
        border = "none",
      },
      task_win = {
        border = "none",
      },
    },
  },
}
