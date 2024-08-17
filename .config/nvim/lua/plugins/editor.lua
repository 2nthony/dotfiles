local skip_features_filetypes = require("util.ft").skip_features_filetypes

return {
  { import = "plugins.extras.editor.overseer" },
  { import = "lazyvim.plugins.extras.editor.refactoring" },
  { import = "lazyvim.plugins.extras.editor.dial" },

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
    "abecodes/tabout.nvim",
    event = { "VeryLazy" },
    opts = {
      exclude = skip_features_filetypes,
    },
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
}
