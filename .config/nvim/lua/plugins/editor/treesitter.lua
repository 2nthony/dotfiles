-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  keys = function()
    return {}
  end,
  opts = {
    ensure_installed = {
      "javascript",
      "typescript",
      "tsx",
      "fish",
      "json",
      "yaml",
      "html",
      "css",
      "vue",
      "svelte",
      "markdown", -- lspsaga
      "markdown_inline", -- lspsaga
    },
    ignore_install = {
      "haskell",
    },
    highlight = {
      enable = true,
    },
  },
}
