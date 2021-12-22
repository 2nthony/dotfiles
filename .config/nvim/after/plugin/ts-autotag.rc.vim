if !exists('g:loaded_nvim_treesitter') | finish | endif

lua << EOF
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
EOF
