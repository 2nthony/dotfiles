-- https://www.lazyvim.org/configurations

local icon = require("util.icon")

return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "vitesse",
    defaults = {
      keymaps = false,
    },
    icons = {
      --icons from 'util.icon'
      icon = icon,
      diagnostics = {
        Error = icon.diagnostics.Error .. " ",
        Warn = icon.diagnostics.Warn .. " ",
        Info = icon.diagnostics.Info .. " ",
        Hint = icon.diagnostics.Hint .. " ",
      },
      git = {
        added = icon.git.AddedLine .. " ",
        modified = icon.git.ModifiedLine .. " ",
        removed = icon.git.RemovedLine .. " ",
      },
      kinds = {
        Codeium = icon.misc.Codeium,
        Color = icon.ui.Palette,
        Module = icon.ui.Package,
      },
      ui = icon.ui,
    },
  },
}
