-- https://github.com/folke/todo-comments.nvim

local icons = require("config.icons")

return {
  "folke/todo-comments.nvim",
  cmd = { "TodoLocList", "TodoTrouble", "TodoTelescope" },
  keys = function()
    return {}
  end,
  opts = {
    keywords = {
      FIX = {
        icon = icons.ui.Bug,
      },
      TODO = {
        icon = icons.ui.Check,
      },
      HACK = {
        icon = icons.ui.Skull,
      },
      WARN = {
        icon = icons.diagnostics.Warn,
      },
      PERF = {
        icon = icons.ui.Dashboard,
      },
      NOTE = {
        icon = icons.ui.Comment,
      },
      TEST = {
        icon = icons.ui.Beaker,
      },
    },
  },
}
