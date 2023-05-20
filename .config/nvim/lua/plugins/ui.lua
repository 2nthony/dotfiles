local skip_features_filetypes = require("util.ft").skip_features_filetypes
local throttle = 100

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

      local branch = { "branch", icon = "󰘬" }
      local location = { "location", padding = { left = 0, right = 1 } }

      opts.sections.lualine_b = { branch }
      opts.sections.lualine_x = { location }
      opts.sections.lualine_y = {}
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
      },
      lsp = {
        progress = {
          enabled = false,
          throttle = throttle,
        },
        signature = {},
        hover = {
          silent = true,
        },
        message = {
          enabled = false,
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
  },

  {
    "goolord/alpha-nvim",
    lazy = true,
    opts = function(_, dashboard)
      local logo = " "

      dashboard.section.header.val = logo

      -- no top gap
      dashboard.opts.layout[1].val = 0
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      filetype_exclude = skip_features_filetypes,
    },
  },
}
