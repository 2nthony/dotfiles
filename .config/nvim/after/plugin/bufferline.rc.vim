if !has_key(plugs, 'bufferline.nvim') | finish | endif

lua << EOF
require('bufferline').setup{
  diagnostics = 'nvim_lsp',
  show_buffer_close_icon = false,
  show_close_icon = false,
}
EOF
