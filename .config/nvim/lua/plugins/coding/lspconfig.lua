-- https://www.lazyvim.org/plugins/lsp#nvim-lspconfig

local float = require("util.opts").float
local icons = require("config.icons")
local icons_ui = icons.get("ui")
local timeout = require("util.lsp").timeout
local get_setting = require("util.vscode").get_setting

vim.lsp.set_log_level(vim.log.levels.ERROR)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float)

return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    opts = {
      -- 'lspconfig.ui.windows'
      ui = {
        window = {
          default_options = {
            border = float.border,
          },
        },
      },
      autoformat = get_setting("editor.formatOnSave"),
      diagnostics = {
        virtual_text = {
          prefix = icons_ui.CircleFilled,
        },
        float = {
          border = float.border,
        },
        severity_sort = true,
      },
      format = {
        timeout_ms = timeout,
      },
      servers = {
        unocss = {},
      },
    },
  },

  -- ui
  {
    "nvim-lspconfig",
    opts = function(_, opts)
      require("lspconfig.ui.windows").default_options = opts.ui.window.default_options
    end,
  },

  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/linting/eslint.lua
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "plugins.extras.lang.vue" },
}
