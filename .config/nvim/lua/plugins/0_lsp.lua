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

  -- lspsaga
  {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    event = { "LspAttach" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      ui = {
        title = false,
      },
      outline = {
        keys = {
          expand_or_jump = "<cr>",
        },
      },
      finder = {
        keys = {
          vsplit = "v",
          split = "s",
          quit = { "q", "<esc>" },
          edit = { "<cr>" },
          close_in_preview = "q",
        },
      },
      definition = {
        edit = "<cr>",
        vsplit = "<C-v>",
        split = "<C-s>",
        tabe = "<C-t>",
      },
      lightbulb = {
        enable = false,
        enable_in_insert = false,
      },
      -- breadcrumbs
      -- https://github.com/glepnir/lspsaga.nvim#lspsaga-symbols-in-winbar
      symbol_in_winbar = {
        enable = false,
      },
      beacon = {
        enable = false,
      },
      implement = {
        enable = false,
      },
      -- diagnostic = {
      --   extend_relatedInformation = true,
      -- },
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

  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.vue" },

  { import = "plugins.extras.linting.eslint" },
  { import = "plugins.extras.formatting.prettier" },
}
