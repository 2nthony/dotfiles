if !executable("gopls")
  echo "gopls: go install golang.org/x/tools/gopls@latest"
  finish
endif

lua << EOF
local lsp = require('lspconfig')
local cmp_lsp = require'cmp_nvim_lsp'
local on_attach = require'helpers.on_attach'
local capabilities = require'helpers.capabilities'

lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

EOF
