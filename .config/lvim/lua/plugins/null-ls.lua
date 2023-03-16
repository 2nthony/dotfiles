-- builtin
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local float_opts = require('utils.float-opts')

null_ls.setup {
  log_level = 'error',
  border = float_opts.border,
  sources = {
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
  },
}
