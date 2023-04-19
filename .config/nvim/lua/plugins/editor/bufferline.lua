return {
  {
    "akinsho/bufferline.nvim",
    keys = function()
      return {}
    end,
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        mode = "tabs",
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        -- show_duplicate_prefix = false,
      },
    },
  },
  {
    "bufferline.nvim",
    dependencies = "vitesse.nvim",
    opts = {
      options = {
        separator_style = "padded_slant",
      },
      highlights = require("vitesse.features.bufferline.slant").highlights,
    },
  },
}
