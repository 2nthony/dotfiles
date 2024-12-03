local skip_features_filetypes = require("util.ft").skip_features_filetypes

return {
  {
    "folke/flash.nvim",
    vscode = true,
    keys = {
      {
        "f",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { forward = true, wrap = false, multi_window = false },
          })
        end,
        desc = "Flash forward",
      },
      {
        "F",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { forward = false, wrap = false, multi_window = false },
          })
        end,
        desc = "Flash backward",
      },
      {
        "gf",
        function()
          require("flash").jump({
            search = { multi_window = true },
          })
        end,
        desc = "Flash window",
      },
    },
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
    keys = {
      { "<m-l>", "<Plug>(TaboutMulti)", desc = "Goto end of pair", mode = { "i" } },
      { "<m-h>", "<Plug>(TaboutBackMulti)", desc = "Goto start of pair", mode = { "i" } },
    },

    opts = {
      exclude = skip_features_filetypes,
      completion = true,
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

  {
    "grug-far.nvim",
    keys = {
      {
        "<leader>sf",
        ':lua require("grug-far").grug_far({ prefills = { flags = vim.fn.expand("%") } })<CR>',
        desc = "Search on current file",
      },
      {
        "<leader>sf",
        ':<C-u>lua require("grug-far").with_visual_selection({ prefills = { flags = vim.fn.expand("%") } })<CR>',
        desc = "Search on current file",
        mode = { "v" },
      },
    },
  },

  {
    "backdround/improved-search.nvim",
    lazy = false,
    vscode = true,
    enabled = true,
    keys = function()
      local search = require("improved-search")

      return {
        { "n", search.stable_next, mode = { "n", "x", "o" }, desc = "Search next" },
        { "N", search.stable_previous, mode = { "n", "x", "o" }, desc = "Search previous" },
        -- https://github.com/LazyVim/LazyVim/commit/23e2b073e6fa75dacaa58dc1fe63392af7f54598
        { "gw", search.current_word, mode = { "n", "x" }, desc = "Search current word" },
        { "gW", search.current_word_strict, mode = { "n", "x" }, desc = "Search current word (strict)" },
        { "!", search.in_place, mode = { "x" }, desc = "Search selection without moving" },
        { "*", search.forward, mode = { "x" }, desc = "Search selection forward" },
        { "#", search.forward, mode = { "x" }, desc = "Search selection backward" },
      }
    end,
    config = function() end,
  },
}
