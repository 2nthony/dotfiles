-- https://github.com/sbdchd/neoformat

vim.cmd([[
  augroup fmt
    autocmd!
    autocmd BufWritePre * Neoformat
  augroup END
]])
