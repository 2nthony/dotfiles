-- https://www.lazyvim.org/configurations
local icons = require("config.icons")

return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "vitesse",
    defaults = {
      keymaps = false,
    },
    icons = {
      diagnostics = icons.get("diagnostics", { "space" }),
      git = icons.get("git", { 'space' }),
      kinds = icons.get("kinds", { 'space' }),
    },
  },
}
