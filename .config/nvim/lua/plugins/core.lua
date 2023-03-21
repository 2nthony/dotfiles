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
        added = icon.git.Added .. " ",
        modified = icon.git.Modified .. " ",
        removed = icon.git.Removed .. " ",
      },
      kinds = {
        Codeium = icon.misc.Codeium,
        Color = icon.ui.Palette,
      },
      ui = icon.ui,
      misc = icon.misc,
    },
  },
}
