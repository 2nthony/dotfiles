local float_opts = require("utils.float-opts")

local config = {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  config = {
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = {
          icon = "❯"
        },
        search_down = {
          icon = lvim.icons.ui.Search .. " "
        },
        search_up = {
          icon = lvim.icons.ui.Search .. " "
        },
      },
    },
    nofity = {
      enabled = false,
    },
    lsp = {
      progress = {
        format = "", -- disable lsp progress, annoying
      },
      signature = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
    },
    -- https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua
    views = {
      mini = {
        border = {
          style = float_opts.border,
        },
        position = {
          row = -2, -- avoid over in status line
        },
        win_options = {
          winblend = float_opts.winblend,
        },
      }
    },
  },
}

return config