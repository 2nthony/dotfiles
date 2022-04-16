if !executable("tailwindcss-language-server")
  echo "[tailwindcss-language-server] npm i -g @tailwindcss/language-server"
  finish
endif

lua << EOF
local lsp = require('lspconfig')
local cmp_lsp = require'cmp_nvim_lsp'
local on_attach = require'helpers.on_attach'
local capabilities = require'helpers.capabilities'

lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

EOF
