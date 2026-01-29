-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/linting/eslint.lua
-- inherit vscode workspace settings

-- if `editor.codeActionsOnSave.source.fixAll.eslint` has value,
-- then run `LazyVim.lsp.format()` on save

local vscode = require("util.vscode")
local settings = vscode.get_settings()
local formatOnSave = settings["editor.formatOnSave"]

vim.g.autoformat = formatOnSave

return {
  { import = "lazyvim.plugins.extras.linting.eslint" },
}
