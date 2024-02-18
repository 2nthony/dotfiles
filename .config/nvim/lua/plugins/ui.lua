local has = require("lazyvim.util").has
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
        separator_style = "slant",
        -- separator_style = { "", "" },
        -- sort_by = "insert_after_current",
      },
    },
  },
  {
    "bufferline.nvim",
    opts = function(_, opts)
      if has("vitesse.nvim") then
        opts.highlights = require("vitesse.plugins.bufferline")
      end
    end,
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
        long_message_to_split = true,
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
          -- enabled = false,
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
      commands = {
        all = {
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
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

  {
    "b0o/incline.nvim",
    event = { "BufReadPost" },
    opts = {
      highlight = {
        groups = {
          InclineNormal = {
            default = true,
            group = "CursorLine",
          },
          InclineNormalNC = {
            default = true,
            group = "TermCursorNC",
          },
        },
      },
      hide = {
        cursorline = true,
      },
      window = {
        margin = {
          vertical = 0,
          horizontal = 1,
        },
        zindex = 29, -- less than zen mode defualt, 40, 40 - 10
      },
    },
  },
}
