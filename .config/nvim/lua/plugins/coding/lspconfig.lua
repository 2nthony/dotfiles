-- https://www.lazyvim.org/plugins/lsp#nvim-lspconfig

local float = require("util.opts").float
local icons = require("config.icons")
local icons_ui = icons.get("ui")

return {
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
  opts = function(_, opts)
    local cwd = vim.fn.getcwd()
    local path = require("lspconfig.util").path
    local root_pattern = require("lspconfig.util").root_pattern
    local find_node_modules_ancestor = require("lspconfig.util").find_node_modules_ancestor
    local windows = require("lspconfig.ui.windows")
    local project_root = find_node_modules_ancestor(cwd)

    windows.default_options = {
      border = float.border,
    }

    opts.autoformat = true

    opts.diagnostics.virtual_text.prefix = icons_ui.CircleFilled

    opts.format.timeout_ms = 5000

    -- servers
    opts.servers.tailwindcss = {
      root_dir = root_pattern("tailwind.config.js", "tailwind.config.cjs", "tailwind.config.ts"),
    }
    -- vue
    -- enable take over mode, disable tsserver
    local vue_path = path.join(project_root, "node_modules", "vue")
    local is_vue = vim.fn.isdirectory(vue_path) == 1
    if is_vue then
      opts.servers.volar = {
        filetypes = {
          "vue",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "json",
        },
      }
      opts.servers.tsserver = {
        root_dir = function()
          return false
        end,
        single_file_support = false,
      }
    end

    return opts
  end,
}
