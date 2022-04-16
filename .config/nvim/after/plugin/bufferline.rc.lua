local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<leader>]', ':BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>[', ':BufferLineCyclePrev<CR>', opts)

bufferline.setup{
  options = {
    diagnostics = 'nvim_lsp',
    show_buffer_close_icons = false,
    show_close_icon = false,
  }
}
