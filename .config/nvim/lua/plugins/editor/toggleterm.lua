-- https://github.com/akinsho/toggleterm.nvim

local float = require("util.opts").float

return {
  "akinsho/toggleterm.nvim",
  lazy = true,
  keys = { [[<c-\>]] },
  opts = {
    open_mapping = [[<c-\>]],
    direction = "float",
    float_opts = {
      border = float.border,
      -- https://github.com/akinsho/toggleterm.nvim/issues/61
      winblend = float.winblend,
    },
  },
}
