-- https://github.com/williamboman/mason.nvim
-- https://www.lazyvim.org/plugins/lsp#masonnvim

local float = require("util.opts").float

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  keys = function()
    return {}
  end,
  opts = {
    log_level = vim.log.levels.ERROR,
    ensure_installed = {
      "stylua",
    },
    ui = {
      border = float.border,
      width = 0.8,
      height = 0.8,
    },
  },
}
