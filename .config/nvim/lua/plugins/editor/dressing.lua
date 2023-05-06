-- https://github.com/stevearc/dressing.nvim

local float = require("util.opts").float

return {
  "stevearc/dressing.nvim",
  opts = {
    input = {
      win_options = {
        winblend = float.winblend,
      },
    },
    select = {
      nui = {
        win_options = {
          winblend = float.winblend,
        },
      },
    },
    builtin = {
      win_options = {
        winblend = float.winblend,
      },
    },
  },
}
