let g:vim_svelte_plugin_use_typescript = 1

lua << EOF
local lsp = require('lspconfig')
local cmp_lsp = require'cmp_nvim_lsp'
local protocol = require'vim.lsp.protocol'
local on_attach = require'helpers.on_attach'
local capabilities = require'helpers.capabilities'

lsp.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

EOF
