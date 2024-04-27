-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/linting/eslint.lua
-- inherit vscode workspace settings

-- if `editor.codeActionsOnSave.source.fixAll.eslint` is true,
-- then run `:EslintFixAll` on save

local vscode = require("util.vscode")
local settings = vscode.get_settings()
local formatOnSave = settings["editor.formatOnSave"]
local codeActionsOnSave = settings["editor.codeActionsOnSave"] or {}
local eslintFixAllOnSave = codeActionsOnSave["source.fixAll.eslint"]

vim.g.autoformat = formatOnSave

return {
  { import = "lazyvim.plugins.extras.linting.eslint" },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    opts = function(_, opts)
      local root = LazyVim.root.cwd()
      local util = require("lspconfig.util")
      local useFlatConfig = false

      local flat_config_file_patterns = {
        "eslint.config.mjs",
        "eslint.config.cjs",
        "eslint.config.js",
      }
      for _, file in ipairs(flat_config_file_patterns) do
        local path = util.path.join(root, file)
        local match = util.path.is_file(path)

        if match then
          useFlatConfig = true
          break
        end
      end
      useFlatConfig = useFlatConfig or settings["eslint.useFlatConfig"] or settings["eslint.experimental.useFlatConfig"]

      opts.servers.eslint = {
        settings = {
          useFlatConfig = useFlatConfig,
        },
      }
      opts.setup.eslint = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
          callback = function(event)
            if eslintFixAllOnSave then
              local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
              if client then
                local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd("EslintFixAll")
                end
              end
            end
          end,
        })
      end
    end,
    -- opts = {
    --   servers = {
    --     eslint = {
    --       settings = {
    --         useFlatConfig = useFlatConfig,
    --       },
    --     },
    --   },
    --   setup = {
    --     eslint = function()
    --       vim.api.nvim_create_autocmd("BufWritePre", {
    --         callback = function(event)
    --           if eslintFixAllOnSave then
    --             local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
    --             if client then
    --               local diag =
    --                 vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
    --               if #diag > 0 then
    --                 vim.cmd("EslintFixAll")
    --               end
    --             end
    --           end
    --         end,
    --       })
    --     end,
    --   },
    -- },
  },
}
