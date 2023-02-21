-- builtin
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "prettierd",
  },
})
