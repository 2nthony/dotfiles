-- https://github.com/jose-elias-alvarez/null-ls.nvim

local prettier_files = { ".prettier", ".prettierrc", ".prettierrc.js", ".prettierrc.json" }

return {
  "jose-elias-alvarez/null-ls.nvim",
  lazy = true,
  opts = function()
    local nls = require("null-ls")

    return {
      log_level = "error",
      sources = {
        nls.builtins.formatting.prettierd.with({
          condition = function(utils)
            return utils.root_has_file(prettier_files)
          end,
        }),
        nls.builtins.formatting.eslint_d.with({
          condition = function(utils)
            return not utils.root_has_file(prettier_files)
          end,
        }),
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.code_actions.eslint_d,

        nls.builtins.formatting.stylua,
      },
    }
  end,
}
