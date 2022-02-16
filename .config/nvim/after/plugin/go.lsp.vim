if !executable("gopls")
  echo "gopls: go install golang.org/x/tools/gopls@latest"
  finish
endif

lua << EOF
local lsp = require('lspconfig')
local cmp_lsp = require'cmp_nvim_lsp'
local protocol = require'vim.lsp.protocol'
local capabilities = require'helpers.capabilities'

lsp.gopls.setup {
  capabilities = capabilities
}

EOF
