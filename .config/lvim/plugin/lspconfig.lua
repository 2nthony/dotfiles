-- builtin

local lsp = require("lspconfig")
local util = require("lspconfig.util")
local lutils = require("lvim.utils")

-- unmap all preset buffer keymaps, use lspsaga instead
lvim.lsp.buffer_mappings.normal_mode = {}

lsp.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  root_dir = util.root_pattern(lutils.join_paths("node_modules", "vue")) or util.root_pattern("package.json")
}
