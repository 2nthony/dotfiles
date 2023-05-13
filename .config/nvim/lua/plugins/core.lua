-- https://www.lazyvim.org/configurations
local icons = require("config.icons")

return {
  {
    "LazyVim/LazyVim",
    opts = {
      icons = {
        diagnostics = icons.get("diagnostics", { "space" }),
        git = icons.get("git", { "space" }),
        kinds = icons.get("kinds", { "space" }),
      },
    },
  },
  { import = "plugins.colorscheme" },
  { import = "plugins.coding" },
  { import = "plugins.editor" },
  { import = "plugins.util" },
  { import = "plugins.syntax" },
  pcall(require, "keymaps") and require("keymaps").plugins or nil,
}
