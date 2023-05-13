local icons = require("config.icons")
local icons_ui = icons.get("ui")
local icons_git = icons.get("git")
local icons_diagnostics_lower_space = icons.get("diagnostics", { "lower_case", "space" })
local icons_ui_space = icons.get("ui", { "space" })
local float = require("util.opts").float
local throttle = 100

return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
        -- show_duplicate_prefix = false,
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with({ icon = icons_ui.Pinned }),
          },
        },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }

      local branch = { "branch", icon = icons_git.Branch }
      local filename = { "filename", path = 1 }
      local diagnostics = {
        "diagnostics",
        symbols = icons_diagnostics_lower_space,
      }
      local filetype = { "filetype" }
      local location = { "location", padding = { left = 0, right = 1 } }

      opts.sections.lualine_a = { "mode" }
      opts.sections.lualine_b = { branch }
      opts.sections.lualine_c = { diagnostics, filename }
      opts.sections.lualine_x = { filetype, location }
      opts.sections.lualine_y = {}
      opts.sections.lualine_z = {}

      return opts
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
        format = {
          cmdline = {
            icon = "❯",
            title = " Command ",
          },
          search_down = {
            icon = icons_ui_space.Search .. "",
          },
          search_up = {
            icon = icons_ui_space.Search .. "",
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
  },
}
