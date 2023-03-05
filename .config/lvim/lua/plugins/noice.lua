-- general
-- https://github.com/folke/noice.nvim

local float_opts = require("utils.float-opts")

local throttle = 1000 / 50

local config = {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  event = "BufReadPost",
  config = {
    health = {
      checker = false,
    },
    throttle = throttle,
    presets = {
      long_message_to_split = true,
    },
    cmdline = {
      view = "cmdline_popup", -- cmdline_popup, cmdline
      format = {
        cmdline = {
          icon = "❯",
          title = " Command ",
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
        -- enabled = false,
        format = "", -- disable lsp progress, annoying
        throttle = throttle,
      },
      signature = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
    },
    -- https://github.com/folke/noice.nvim/blob/main/lua/noice/config/routes.lua
    routes = {
      {
        filter = {
          event = 'msg_show',
          find = 'written',
        },
        opts = { skip = true },
      },
      {
        filter = {
          any = {
            { event = 'msg_show', find = '; before' },
            { event = 'msg_show', find = '; after' },
          },
        },
        opts = { skip = true },
      },
      {
        filter = {
          any = {
            { event = 'lsp', kind = 'progress', find = 'code_action' },
            { event = 'lsp', kind = 'progress', find = 'formatting' },
            { event = 'lsp', kind = 'progress', find = 'diagnostics' },
            { event = 'lsp', kind = 'progress', find = 'diagnostics_on_open' },
          },
        },
        opts = { skip = true },
      },
    },
    -- https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua
    views = {
      cmdline_popup = {
        zindex = 100,
        border = {
          padding = { 0, 0 },
        },
        position = {
          row = "30%"
        },
      },
      mini = {
        border = {
          -- style = float_opts.border,
        },
        position = {
          -- row = -2, -- avoid over in status line
        },
        win_options = {
          winblend = float_opts.winblend,
        },
      }
    },
  },
}

return config
