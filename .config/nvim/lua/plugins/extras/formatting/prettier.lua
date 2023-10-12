-- i don't use prettierd
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/formatting/prettier.lua

local prettier = require("lazyvim.plugins.extras.formatting.prettier")

prettier[1] = {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "prettier",
    },
  },
}

return prettier
