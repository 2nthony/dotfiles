-- local get_setting = require("util.vscode").get_setting

return {
  { import = "lazyvim.plugins.extras.linting.eslint" },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    opts = {
      -- autoformat = get_setting("editor.formatOnSave") or nil,
    },
  },
}
