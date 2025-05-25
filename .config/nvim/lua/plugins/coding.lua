return {
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
}
