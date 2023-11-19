local skip_features_filetypes = require("util.ft").skip_features_filetypes

return {
  { "rcarriga/nvim-notify", enabled = false },
  { "SmiteshP/nvim-navic", enabled = false },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }

      local location = { "location", padding = { left = 0, right = 1 } }

      table.insert(opts.sections.lualine_x, location)
      table.insert(opts.sections.lualine_x, "filetype")

      -- location
      opts.sections.lualine_y = {}
      -- time
      opts.sections.lualine_z = {}
    end,
  },

  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      presets = {
        -- command_palette = false,
        -- bottom_search = false,
      },
      health = {
        checker = false,
      },
      cmdline = {
        enabled = false,
        view = "cmdline", -- cmdline_popup, cmdline
      },
      lsp = {
        progress = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
        hover = {
          silent = true,
        },
        message = {
          enabled = false,
        },
      },
      messages = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
    },
  },

  {
    "dashboard-nvim",
    opts = {
      config = {
        header = {},
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      exclude = {
        filetypes = skip_features_filetypes,
      },
    },
  },
}
