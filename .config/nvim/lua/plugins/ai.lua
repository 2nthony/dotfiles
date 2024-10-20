return {
  { import = "lazyvim.plugins.extras.coding.copilot" },
  { import = "plugins.extras.ai.avante" },
  {
    "yetone/avante.nvim",
    opts = {
      provider = "openai",
      openai = {
        model = "gpt-4o-mini",
      },
      windows = {
        width = 40,
      },
    },
  },
}
