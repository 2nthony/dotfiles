local vscode = require("util.vscode")
local settings = vscode.get_settings()
local formatOnSave = settings["editor.formatOnSave"]
local codeActionsOnSave = settings["editor.codeActionsOnSave"] or {}
local eslintFixAllOnSave = codeActionsOnSave["source.fixAll.eslint"]

local autoformat = eslintFixAllOnSave or formatOnSave

return {
  { import = "lazyvim.plugins.extras.linting.eslint" },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    opts = {
      autoformat = autoformat,
    },
  },
}
