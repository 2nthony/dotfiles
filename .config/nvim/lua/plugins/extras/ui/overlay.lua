return {
  -- colorscheme
  {
    "vitesse.nvim",
    opts = {
      -- transparent_background = false,
      transparent_float_background = false,
      telescope_border_follow_float_background = true,
      lspsaga_border_follow_float_background = true,
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

  -- ui
  {
    "dressing.nvim",
    optional = true,
    opts = {
      input = {
        border = "none",
      },
      select = {
        nui = {
          border = "none",
        },
        builtin = {
          border = "none",
        },
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
