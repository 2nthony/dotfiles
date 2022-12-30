-- builtin
-- https://github.com/akinsho/bufferline.nvim

local ok = pcall(require, "bufferline")
if not ok then
  return
end

local bufferline = lvim.builtin.bufferline

bufferline.options = {
  mode = "tabs",
  separator_style = 'slant',
  always_show_bufferline = false,
  show_buffer_close_icons = false,
  show_close_icon = false,
  color_icons = true
}

bufferline.highlights = {
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
  },
}
