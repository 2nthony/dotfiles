if !has_key(plugs, 'nvim-spectre') | finish | endif

nnoremap <leader>S :lua require('spectre').open()<CR>

" search current word
nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s :lua require('spectre').open_visual()<CR>
" search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<CR>

lua << EOF
require('spectre').setup()
EOF
