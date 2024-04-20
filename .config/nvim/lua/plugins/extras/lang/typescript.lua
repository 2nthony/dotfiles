return {
  { import = "lazyvim.plugins.extras.lang.typescript" },

  {
    "nvim-lspconfig",
    opts = {
      setup = {
        -- return `true` don't setup with lspconfig
        tsserver = function()
          return true
        end,
      },
    },
  },

  {
    "pmizio/typescript-tools.nvim",
    opts = {
      settings = {
        complete_function_calls = true,
        expose_as_code_action = "all",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
  },
}
