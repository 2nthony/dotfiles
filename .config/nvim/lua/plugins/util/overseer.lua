-- https://github.com/stevearc/overseer.nvim

local float = require("util.opts").float

return {
  "stevearc/overseer.nvim",
  lazy = true,
  cmd = {
    "OverseerOpen",
    "OverseerClose",
    "OverseerToggle",
    "OverseerSaveBundle",
    "OverseerLoadBundle",
    "OverseerDeleteBundle",
    "OverseerRunCmd",
    "OverseerRun",
    "OverseerInfo",
    "OverseerBuild",
    "OverseerQuickAction",
    "OverseerTaskAction",
    "OverseerClearAction",
  },
  opts = {
    form = {
      border = float.border,
      win_opts = {
        winblend = float.winblend,
      },
    },
    confirm = {
      border = float.border,
      win_opts = {
        winblend = float.winblend,
      },
    },
    task_win = {
      border = float.border,
      win_opts = {
        winblend = float.winblend,
      },
    },
  },
}
