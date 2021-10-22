if !exists('g:lspconfig')
  finish
endif

lua << EOF
--vim.lsp.set_log_level("debug")
EOF

lua << EOF
-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

-- hover
local pop_opts = { border = "rounded", max_width = 80 }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers, pop_opts)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)

EOF
