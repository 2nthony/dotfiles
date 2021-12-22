if !exists('g:loaded_nvim_treesitter')
  finish
endif

lua << EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true,
  }
}
EOF
