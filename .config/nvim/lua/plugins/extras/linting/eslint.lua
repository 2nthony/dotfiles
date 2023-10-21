-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/linting/eslint.lua
-- inherit vscode workspace settings

-- if `editor.codeActionsOnSave.source.fixAll.eslint` is true,
-- then run `:EslintFixAll` on save

local vscode = require("util.vscode")
local settings = vscode.get_settings()
local formatOnSave = settings["editor.formatOnSave"]
local codeActionsOnSave = settings["editor.codeActionsOnSave"] or {}
local eslintFixAllOnSave = codeActionsOnSave["source.fixAll.eslint"]
local useFlatConfig = settings["eslint.experimental.useFlatConfig"]

vim.g.autoformat = formatOnSave

return {
  { import = "lazyvim.plugins.extras.linting.eslint" },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    opts = {
      servers = {
        eslint = {
          settings = {
            experimental = {
              useFlatConfig = useFlatConfig,
            },
          },
        },
      },
      setup = {
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              if eslintFixAllOnSave then
                local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
                if client then
                  local diag =
                    vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                  if #diag > 0 then
                    vim.cmd("EslintFixAll")
                  end
                end
              end
            end,
          })
        end,
      },
    },
  },
}
