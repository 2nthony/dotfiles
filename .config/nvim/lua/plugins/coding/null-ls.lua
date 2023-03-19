-- https://github.com/jose-elias-alvarez/null-ls.nvim

return {
  "jose-elias-alvarez/null-ls.nvim",
  lazy = true,
  opts = function()
    local nls = require("null-ls")

    return {
      log_level = "error",
      sources = {
        nls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file({ ".prettierrc", ".prettierrc.js", ".prettierignore" })
          end,
        }),
        nls.builtins.formatting.eslint.with({
          condition = function(utils)
            return not utils.root_has_file({ ".prettierrc", ".prettierrc.js", ".prettierignore" })
          end,
        }),
        nls.builtins.diagnostics.eslint,
        nls.builtins.code_actions.eslint,

        nls.builtins.formatting.stylua,
      },
    }
  end,
}
