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
  opts = function(_, opts)
    local float = require("util.opts").float
    local nls = require("null-ls")

    return vim.tbl_extend("force", opts, {
      log_level = "error",
      border = float.border,
      sources = vim.list_extend(opts.sources, {
        nls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file(prettier_files)
          end,
        }),
        nls.builtins.formatting.eslint_d,
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.code_actions.eslint_d,
      }),
    })
  end,
}
