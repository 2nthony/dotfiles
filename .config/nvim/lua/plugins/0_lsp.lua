-- https://www.lazyvim.org/plugins/lsp#nvim-lspconfig

vim.lsp.set_log_level(vim.log.levels.OFF)

local vscode = require("util.vscode")

vim.g.autoformat = vscode.get_setting("editor.formatOnSave")

return {
  {
    "mason.nvim",
    dependencies = {
      "mason-lspconfig.nvim",
    },
    opts = {
      log_level = vim.log.levels.OFF,
    },
  },

  -- lsp settings
  {
    "tamago324/nlsp-settings.nvim",
    cmd = "LspSettings",
    opts = {},
  },
}
