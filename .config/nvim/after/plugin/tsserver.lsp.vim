if !executable("tsserver")
  echo "[tsserver] npm i -g typescript typescript-language-server"
  finish
endif

lua << EOF
local lsp = require('lspconfig')
local cmp_lsp = require'cmp_nvim_lsp'
local protocol = require'vim.lsp.protocol'
local capabilities = require'helpers.capabilities'

lsp.tsserver.setup {
  --filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities,
}

EOF
