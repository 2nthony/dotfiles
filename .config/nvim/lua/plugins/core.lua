-- https://www.lazyvim.org/configurations

local icons = require("icons")

return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "vitesse",
    defaults = {
      keymaps = false,
    },
    icons = icons,
  },
}
