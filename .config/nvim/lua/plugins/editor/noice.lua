-- https://github.com/folke/noice.nvim

local icons = require("util.icon")
local float = require("util.opts").float
local throttle = 100

return {
  "folke/noice.nvim",
  keys = function()
    return {}
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    throttle = throttle,
    presets = {
      -- command_palette = false,
      bottom_search = false,
    },
    health = {
      checker = false,
    },
    cmdline = {
      -- view = "cmdline", -- cmdline_popup, cmdline
      format = {
        cmdline = {
          icon = "❯",
          title = " Command ",
        },
        search_down = {
          icon = icons.ui.Search .. " ",
        },
        search_up = {
          icon = icons.ui.Search .. " ",
        },
      },
    },
    nofity = {
      enabled = false,
    },
    lsp = {
      progress = {
        enabled = false,
        throttle = throttle,
      },
      signature = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
      message = {
        enabled = false,
      },
    },
    -- https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua
    views = {
      mini = {
        win_options = {
          winblend = float.winblend,
        },
      },
    },
  },
}
