return {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  pin = true,
  ft = { "markdown", "md" },
}
