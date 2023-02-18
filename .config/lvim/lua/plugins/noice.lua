return {
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
          icon = "❯_"
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
          style = "rounded"
        },
        win_options = {
          winblend = 0
        }
      }
    },
  },
}
