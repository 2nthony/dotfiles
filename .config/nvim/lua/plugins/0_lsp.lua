-- https://www.lazyvim.org/plugins/lsp#nvim-lspconfig

vim.lsp.set_log_level(vim.log.levels.OFF)

local vscode = require("util.vscode")

vim.g.autoformat = vscode.get_setting("editor.formatOnSave")

return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "VeryLazy" },
    opts = {
      diagnostics = {
        virtual_text = {
          source = false,
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      log_level = vim.log.levels.OFF,
      ensure_installed = {
        "stylua",
      },
    },
  },

  -- lsp settings
  {
    "tamago324/nlsp-settings.nvim",
    cmd = "LspSettings",
    opts = {},
  },

  -- stop inactive lsp clients
  {
    "zeioth/garbage-day.nvim",
    event = "VeryLazy",
    opts = {
      excluded_lsp_clients = {
        "copilot",
      },
    },
  },
}
