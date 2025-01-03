vim.g.snacks_animate = false

return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = "",
      },
    },
    bigfile = {
      size = 0.5 * 1024 * 1024,
    },
  },
}
