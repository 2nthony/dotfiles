if !executable("svelteserver")
  echo "[svelteserver] npm i -g svelte-language-server"
  finish
endif

let g:vim_svelte_plugin_use_typescript = 1

lua << EOF
local lsp = require('lspconfig')
local cmp_lsp = require'cmp_nvim_lsp'
local protocol = require'vim.lsp.protocol'
local capabilities = require'helpers.capabilities'

lsp.svelte.setup {
  capabilities = capabilities
}

EOF
