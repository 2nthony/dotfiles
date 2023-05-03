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
      "scss",
      "vue",
      "svelte",
      "markdown", -- lsp, lspsaga diagnostic
      "markdown_inline", -- lsp, lspsaga diagnostic
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
