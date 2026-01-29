vim.g.ai_cmp = false

return {
  { import = "lazyvim.plugins.extras.ai.codeium" },
  { import = "lazyvim.plugins.extras.ai.avante" },

  {
    "yetone/avante.nvim",
    opts = {
      mappings = {
        submit = {
          insert = "<C-CR>",
        },
      },
      provider = "openai",
      providers = {
        openai = {
          model = "deepseek-chat",
          endpoint = "https://api.deepseek.com",
        },
      },
    },
  },
}
