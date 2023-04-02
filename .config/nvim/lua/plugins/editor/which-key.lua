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
  -- override to disable presets keymaps
  -- https://www.lazyvim.org/plugins/editor#which-keynvim
  config = true,
}
