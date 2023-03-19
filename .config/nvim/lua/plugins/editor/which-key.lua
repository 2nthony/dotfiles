local float = require("util.opts").float

return {
  "folke/which-key.nvim",
  opts = {
    window = {
      border = float.border,
      winblend = float.winblend,
    },
    plugins = {
      spelling = true,
    },
  },
  -- disabled keymaps from https://www.lazyvim.org/plugins/editor#which-keynvim
  config = true,
}
