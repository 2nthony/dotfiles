if !executable("vue-language-server")
  echo "[volar]: npm i -g @volar/vue-language-server"
  finish
endif

lua << EOF
local lsp = require'lspconfig'
local on_attach = require'helpers.on_attach'

lsp.volar.setup{
  on_attach = on_attach,
}
EOF
