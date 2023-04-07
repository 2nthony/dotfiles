-- https://github.com/jose-elias-alvarez/null-ls.nvim

local prettier_files = {
  ".prettier",
  ".prettierrc",
  ".prettierrc.js",
  ".prettierrc.json",
}

return {
  "jose-elias-alvarez/null-ls.nvim",
  lazy = true,
  opts = function()
    local float = require("util.opts").float
    local nls = require("null-ls")

    return {
      log_level = "error",
      border = float.border,
      sources = {
        nls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file(prettier_files)
          end,
        }),
        nls.builtins.formatting.eslint_d,
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.code_actions.eslint_d,

        nls.builtins.formatting.stylua,
      },
    }
  end,
}
