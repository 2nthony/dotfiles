if !exists('loaded_lspkind') | finish | endif

echo "loaded_lspkind"

lua << EOF
local lspkind = require'lspkind'
local cmp = require'cmp'
cmp.setup {
  formatting = {
    format = lspkind.cmp_format()
  }
}

EOF
