if !executable("rls")
  echo "[rls] not detected"
  finish
endif

lua << EOF
local lsp = require('lspconfig')
local cmp_lsp = require'cmp_nvim_lsp'
local protocol = require'vim.lsp.protocol'
local capabilities = require'helpers.capabilities'
local on_attach = function(client)
  require'completion'.on_attach(client)
end

lsp.rls.setup {
  capabilities = capabilities,
}

lsp.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    }
  }
}

EOF
