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
  pcall(require, "keymaps") and require("keymaps").plugins or nil,
}
