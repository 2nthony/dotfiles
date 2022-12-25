-- builtin

local lsp = require("lspconfig")
local util = require'lspconfig.util'

-- unmap all preset buffer keymaps, use lspsaga instead
lvim.lsp.buffer_mappings.normal_mode = {}

-- disable auto install servers
lvim.lsp.installer.setup.automatic_installation = nil

lsp.volar.setup {}
lsp.tailwindcss.setup {
  root_dir = util.root_pattern('tailwind.config.js', 'tailwind.config.ts')
}

