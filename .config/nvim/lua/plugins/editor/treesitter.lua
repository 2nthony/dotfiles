-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  keys = function()
    return {}
  end,
  opts = {
    ensure_installed = {
      "comment",
      "lua",
      "help",
      "javascript",
      "jsdoc",
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
  dependencies = {
    -- https://github.com/windwp/nvim-ts-autotag
    {
      "windwp/nvim-ts-autotag",
      opts = {
        filetypes = {
          "html",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "xml",
        },
      },
    },
  },
}
