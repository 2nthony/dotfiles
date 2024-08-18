-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/linting/eslint.lua
-- inherit vscode workspace settings

-- if `editor.codeActionsOnSave.source.fixAll.eslint` has value,
-- then run `LazyVim.lsp.format()` on save

local vscode = require("util.vscode")
local settings = vscode.get_settings()
local formatOnSave = settings["editor.formatOnSave"]
local codeActionsOnSave = settings["editor.codeActionsOnSave"] or {}
local eslintFixAllOnSave = codeActionsOnSave["source.fixAll.eslint"]

vim.g.autoformat = formatOnSave

return {
  { import = "lazyvim.plugins.extras.linting.eslint" },
  {
    "nvim-lspconfig",
    opts = function(_, opts)
      if eslintFixAllOnSave then
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

        useFlatConfig = useFlatConfig
          or settings["eslint.useFlatConfig"]
          or settings["eslint.experimental.useFlatConfig"]

        opts.servers.eslint.settings.useFlatConfig = useFlatConfig

        vim.api.nvim_create_autocmd("BufWritePre", {
          callback = function()
            LazyVim.lsp.format({ name = "eslint" })
          end,
        })
      end
    end,
  },
}
