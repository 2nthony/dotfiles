-- https://github.com/folke/todo-comments.nvim

local icons = require("config.icons")
local icons_ui = icons.get("ui", { 'space' })
local icons_diagnostics = icons.get("diagnostics", { 'space' })

return {
  "folke/todo-comments.nvim",
  cmd = { "TodoLocList", "TodoTrouble", "TodoTelescope" },
  keys = function()
    return {}
  end,
  opts = {
    keywords = {
      FIX = {
        icon = icons_ui.Bug,
      },
      TODO = {
        icon = icons_ui.Check,
      },
      HACK = {
        icon = icons_ui.Skull,
      },
      WARN = {
        icon = icons_diagnostics.Warn,
      },
      PERF = {
        icon = icons_ui.Dashboard,
      },
      NOTE = {
        icon = icons_ui.Comment,
      },
      TEST = {
        icon = icons_ui.Beaker,
      },
    },
  },
}
