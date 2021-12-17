if !has_key(plugs, 'todo-comments.nvim') | finish | endif

lua << EOF
require('todo-comments').setup {}
EOF
