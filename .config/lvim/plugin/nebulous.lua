-- theme
-- https://github.com/Yagua/nebulous.nvim

local ok, nebulous = pcall(require, "nebulous")
if not ok then
  return
end

if vim.g.colorscheme ~= "nebulous" then
  return
end

nebulous.setup {
  variant = "fullmoon",
  disable = {
    background = true,
    terminal_colors = true,
  },
  italic = {
    comments  = true,
    keywords  = false,
    functions = false,
    variables = true,
  },
}

-- fullmoon
-- https://github.com/Yagua/nebulous.nvim/blob/main/lua/nebulous/colors/fullmoon.lua
local bufferline = lvim.builtin.bufferline
local fullmoon = require("nebulous.colors.Fullmoon")
bufferline.highlights = {
  separator = {
    fg = fullmoon.Custom_1,
    bg = fullmoon.background,
  },
  separator_selected = {
    fg = fullmoon.Custom_1,
  },
  background = {
    bg = fullmoon.background,
  },
  buffer_selected = {
    bold = true,
  },
  fill = {
    bg = fullmoon.Custom_1,
  },
}

vim.cmd("colorscheme nebulous")
