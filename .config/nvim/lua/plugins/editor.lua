local skip_features_filetypes = require("util.ft").skip_features_filetypes
local float = require("util.opts").float

return {
  { import = "lazyvim.plugins.extras.editor.mini-files" },

  {
    "folke/flash.nvim",
    vscode = true,
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        -- disable flit, I use `f` for search/find
        char = {
          enabled = false,
        },
      },
    },
  },

  {
    "RRethy/vim-illuminate",
    opts = {
      filetypes_denylist = skip_features_filetypes,
    },
  },

  {
    "abecodes/tabout.nvim",
    event = { "VeryLazy" },
    opts = {},
  },
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<M-f>",
        function()
          require("ssr").open()
        end,
        desc = "Search and replace",
      },
    },
    opts = {
      border = float.border,
      min_width = 50,
      min_height = 5,
      max_width = 120,
      max_height = 25,
      keymaps = {
        close = "q",
        next_match = "n",
        prev_match = "N",
        replace_confirm = "<cr>",
        replace_all = "<leader><cr>",
      },
    },
  },

  {
    "LintaoAmons/easy-commands.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "NeogitOrg/neogit",
    },
  },
}
