-- builtin
-- https://github.com/akinsho/toggleterm.nvim

local ok = pcall(require, "toggleterm")
if not ok then
  return
end

local float_opts = require("utils.float-opts")

local Terminal = require("toggleterm.terminal").Terminal
local toggleterm = lvim.builtin.terminal

toggleterm.open_mapping = [[<c-\>]]
toggleterm.direction = "float"
toggleterm.float_opts = {
  border = float_opts.border,
  -- https://github.com/akinsho/toggleterm.nvim/issues/61
  winblend = float_opts.winblend,
  highlights = {
    border = "Normal",
    background = "Normal",
  },
}

-- NOTE: need to install lazygit first
local lazygit = Terminal:new {
  cmd = "lazygit",
  hidden = true,
  direction = toggleterm.direction,
  float_opts = toggleterm.float_opts,
}
function LAZYGIT_TOGGLE()
  lazygit:toggle()
end
