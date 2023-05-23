-- https://www.lazyvim.org/configurations

return {
  {
    "LazyVim/LazyVim",
    opts = {
      icons = {
        kinds = {
          Codeium = " ",
        },
      },
    },
  },
  pcall(require, "keymaps") and require("keymaps").plugins or nil,
}
