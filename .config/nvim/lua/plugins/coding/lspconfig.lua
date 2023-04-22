-- https://www.lazyvim.org/plugins/lsp#nvim-lspconfig

local float = require("util.opts").float
local icons = require("config.icons")
local icons_ui = icons.get("ui")
local timeout = require("util.lsp").timeout

return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    init = function()
      -- reset lazyvim lsp keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- clone avoid infinite loop
      local keymaps = vim.deepcopy(keys)
      for _, keymap in ipairs(keymaps) do
        local key = keymap[1]
        if key then
          keys[#keys + 1] = { key, false }
        end
      end

      vim.lsp.set_log_level(vim.log.levels.ERROR)
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float)
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float)
    end,
    opts = {
      -- 'lspconfig.ui.windows'
      ui = {
        window = {
          default_options = {
            border = float.border,
          },
        },
      },
      autoformat = true,
      diagnostics = {
        virtual_text = {
          prefix = icons_ui.CircleFilled,
        },
        update_in_insert = true,
        float = {
          header = "",
          source = "always",
          border = float.border,
        },
        severity_sort = true,
      },
      format = {
        timeout_ms = timeout,
      },
      servers = {
        tailwindcss = {},
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
  -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/linting/eslint.lua
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "plugins.coding.extras.vue" },
}
