lua << EOF
local nvim_lsp = require'lspconfig'

require('lspconfig').denols.setup{
  root_dir = nvim_lsp.util.root_pattern("deno.json"),
}
EOF
