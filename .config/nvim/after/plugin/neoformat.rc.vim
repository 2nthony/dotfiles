"if !exists('g:loaded_neoformat') | finish | endif
if !has_key(plugs, 'neoformat') | finish | endif

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
