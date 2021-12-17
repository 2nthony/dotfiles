lua << EOF
local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', 'b]', ':BufferLineCycleNext<CR>', opts)
map('n', 'b[', ':BufferLineCyclePrev<CR>', opts)

bufferline.setup{
  options = {
    diagnostics = 'nvim_lsp',
    show_buffer_close_icons = false,
    show_close_icon = false,
  }
}
EOF
