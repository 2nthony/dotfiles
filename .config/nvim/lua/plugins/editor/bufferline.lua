local icons = require("config.icons")
local icons_ui = icons.get("ui")

return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      mode = "tabs",
      show_buffer_close_icons = false,
      show_close_icon = false,
      -- show_duplicate_prefix = false,
      groups = {
        items = {
          require("bufferline.groups").builtin.pinned:with({ icon = icons_ui.Pinned }),
        },
      },
    },
  },
}
