return {
  "akinsho/bufferline.nvim",
  keys = function()
    return {}
  end,
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      mode = "tabs",
      separator_style = { "", "" }, -- disable the separator
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      color_icons = true,
    },
  },
}
