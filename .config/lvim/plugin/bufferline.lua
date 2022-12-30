-- builtin
-- https://github.com/akinsho/bufferline.nvim

local ok = pcall(require, "bufferline")
if not ok then
  return
end

local bufferline = lvim.builtin.bufferline

bufferline.options = {
  diagnostics = "nvim_lsp",
  mode = "tabs",
  separator_style = { "", "" }, -- disable the separator
  always_show_bufferline = false,
  show_buffer_close_icons = false,
  show_close_icon = false,
  color_icons = true
}

bufferline.highlights = {
  buffer_selected = {
    fg = '#fdf6e3',
    bold = true,
  },
}
