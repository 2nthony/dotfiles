local status_bufferline_ok, bufferline = pcall(require, 'bufferline')
if (not status_bufferline_ok) then return end

bufferline.setup{
  options = {
    diagnostics = 'nvim_lsp',
    show_buffer_close_icons = false,
    show_close_icon = false,
  }
}
