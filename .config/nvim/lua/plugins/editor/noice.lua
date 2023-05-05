-- https://github.com/folke/noice.nvim

local icons = require("config.icons")
local icons_ui = icons.get("ui", { "space" })
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
      view = "cmdline", -- cmdline_popup, cmdline
      format = {
        cmdline = {
          icon = "❯",
          title = " Command ",
        },
        search_down = {
          icon = icons_ui.Search .. "",
        },
        search_up = {
          icon = icons_ui.Search .. "",
        },
      },
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
    messages = {
      -- enabled = false,
    },
    notify = {
      enabled = false,
    },
  },
  config = function(_, opts)
    local defaults = require("noice.config").defaults()
    -- hide cmdheight if cmdline enabled
    if opts.cmdline.enabled or defaults.cmdline.enabled then
      vim.opt.cmdheight = 0
    end

    require("noice").setup(opts)
  end,
}
