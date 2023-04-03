local slant = require("vitesse.features.bufferline.slant")

return {
  "akinsho/bufferline.nvim",
  dependencies = { "2nthony/vitesse.nvim" },
  event = function()
    return { "BufReadPost" }
  end,
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
      show_duplicate_prefix = false,
    },
    highlights = slant.highlights,
  },
}
