-- builtin

local lsp = require("lspconfig")

-- unmap all preset buffer keymaps, use lspsaga instead
lvim.lsp.buffer_mappings.normal_mode = {}

lsp.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
}
