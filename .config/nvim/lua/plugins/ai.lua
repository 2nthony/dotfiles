return {
  { import = "plugins.extras.ai.avante" },
  {
    "yetone/avante.nvim",
    opts = {
      provider = "openai",
      openai = {
        model = "deepseek-chat",
        endpoint = "https://api.deepseek.com",
      },
      windows = {
        width = 40,
      },
    },
  },
}
