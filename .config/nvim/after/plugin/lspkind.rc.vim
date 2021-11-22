if !exists('g:loaded_cmp')
  finish
endif

lua << EOF
local cmp = require'cmp'
local status, lspkind = pcall(require, 'lspkind')
if (not status) then return end

cmp.setup {
  formatting = {
    format = lspkind.cmp_format()
  }
}

EOF
