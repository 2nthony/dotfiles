lua << EOF
local lsp = require('lspconfig')
local cmp_lsp = require'cmp_nvim_lsp'
local protocol = require'vim.lsp.protocol'
local capabilities = require'helpers.capabilities'

lsp.tsserver.setup {
  --filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities,
  root_dir = lsp.util.root_pattern("package.json"),
}

EOF
