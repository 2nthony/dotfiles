-- https://github.com/norcalli/nvim-colorizer.lua

return {
  "NvChad/nvim-colorizer.lua",
  lazy = true,
  event = { "BufReadPost" },
  opts = {
    user_default_options = {
      RRGGBBAA = true,
      tailwind = true,
    },
  },
}
