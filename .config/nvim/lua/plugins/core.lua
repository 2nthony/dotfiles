-- https://www.lazyvim.org/configurations
local icons = require("config.icons")

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vitesse",
      defaults = {
        keymaps = false,
      },
      icons = {
        diagnostics = icons.get("diagnostics", { "space" }),
        git = icons.get("git", { "space" }),
        kinds = icons.get("kinds", { "space" }),
      },
    },
  },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "plugins.colorscheme" },
  { import = "plugins.coding" },
  { import = "plugins.editor" },
  { import = "plugins.util" },
  { import = "plugins.syntax" },
}
