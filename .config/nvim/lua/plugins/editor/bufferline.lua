local slant = require("vitesse.features.bufferline.slant")

return {
  "akinsho/bufferline.nvim",
  keys = function()
    return {}
  end,
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      mode = "tabs",
      separator_style = slant.separator_style,
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      color_icons = true,
    },
    highlights = slant.highlights,
  },
}
