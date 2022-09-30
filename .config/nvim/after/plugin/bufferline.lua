-- https://github.com/akinsho/bufferline.nvim
local status_bufferline_ok, bufferline = pcall(require, "bufferline")
if (not status_bufferline_ok) then
  return
end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'padded_slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
      bg = '#073642'
    }
  },
})
