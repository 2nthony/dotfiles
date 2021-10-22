lua << EOF
local lsp = require('lspconfig')
local cmp_lsp = require'cmp_nvim_lsp'
local protocol = require'vim.lsp.protocol'
local on_attach = require'helpers.on_attach'
local capabilities = require'helpers.capabilities'

lsp.tsserver.setup {
  on_attach = on_attach,
  --filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities
}

EOF
