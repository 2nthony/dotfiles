lua << EOF
local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

local set_keymap = require'helpers.set_keymap'
set_keymap('n', 'b]', ':BufferLineCycleNext<CR>')
set_keymap('n', 'b[', ':BufferLineCyclePrev<CR>')

bufferline.setup{
  options = {
    diagnostics = 'nvim_lsp',
    show_buffer_close_icons = false,
    show_close_icon = false,
  }
}
EOF
