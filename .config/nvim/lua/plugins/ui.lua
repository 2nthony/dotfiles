local icons = require("config.icons")
local icons_ui = icons.get("ui")
local icons_git = icons.get("git")
local icons_diagnostics_lower_space = icons.get("diagnostics", { "lower_case", "space" })
local icons_ui_space = icons.get("ui", { "space" })
local icons_misc_space = icons.get("misc", { "space" })
local float = require("util.opts").float
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

      dashboard.section.buttons.val = {
        dashboard.button("n", icons_ui_space.NewFile .. " New File", ":ene! <cr>"),
        dashboard.button(
          "f",
          icons_ui_space.GoToFile .. " Find File",
          ":lua require('lazyvim.util').telescope('files')() <cr>"
        ),
        dashboard.button("e", icons_ui_space.FileTree .. " File Explorer", ":Neotree toggle<cr>"),
        dashboard.button("r", icons_ui_space.Files .. " Recent files", ":Telescope oldfiles<cr>"),
        dashboard.button("s", icons_ui_space.History .. " Restore sessions", ":lua require('persistence').load()<cr>"),
        dashboard.button("l", icons_misc_space.Lazy .. " Lazy", ":Lazy<cr>"),
        dashboard.button("m", icons_ui_space.Package .. " Mason", ":Mason<cr>"),
        dashboard.button("c", icons_ui_space.Gear .. " Config", ":e $MYVIMRC <cr>"),
        dashboard.button("q", icons_ui_space.SignOut .. " Quit", ":q<cr>"),
        dashboard.button("x", icons_ui_space.CloseAll .. " Exit (Quit all)", ":qa<cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButton"
        button.opts.hl_shortcut = "AlphaShortcut"
      end

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
