-- https://github.com/lewis6991/gitsigns.nvim
-- https://www.lazyvim.org/plugins/editor#gitsignsnvim

local float = require("util.opts").float

return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  cmd = { "Gitsigns" },
  opts = {
    current_line_blame = true,
    preview_config = {
      border = float.border,
      style = float.style,
    },
  },
}
