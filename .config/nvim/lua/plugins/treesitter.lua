return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "comment",
        "lua",
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
          enable_close_on_slash = false, -- disable case: `<div /` become `<div /div>`
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
  },
}
