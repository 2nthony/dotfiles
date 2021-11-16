if !exists('g:loaded_commentary') | finish | endif
if !exists('g:loaded_nvim_treesitter') | finish | endif

lua << EOF
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}
EOF
