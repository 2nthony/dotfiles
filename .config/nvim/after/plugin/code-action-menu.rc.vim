if !has_key(plugs, "nvim-code-action-menu")
  finish
endif

nmap <silent> <leader>ca <Cmd>CodeActionMenu<CR>
vmap <silent> <leader>ca <Cmd>CodeActionMenu<CR>
