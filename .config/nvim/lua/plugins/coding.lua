return {
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  { import = "lazyvim.plugins.extras.coding.neogen" },
  { import = "plugins.extras.coding.autopairs" },
  { import = "plugins.extras.coding.comment" },

  {
    "Wansmer/treesj",
    keys = {
      {
        "<leader>ut",
        function()
          require("treesj").toggle()
        end,
        desc = "Treesitter split/join blocks",
        silent = true,
      },
    },
    opts = {
      use_default_keymaps = false,
      max_join_length = 999,
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    opts = {
      file = { suffix = "" },
      window = { suffix = "" },
    },
  },
}
