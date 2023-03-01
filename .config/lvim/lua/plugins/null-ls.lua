-- builtin
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

vim.lsp.buf.format({ timeout_ms = 5000 })

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
  },
}
