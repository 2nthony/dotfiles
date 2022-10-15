-- builtin
-- https://github.com/akinsho/toggleterm.nvim

local toggleterm = lvim.builtin.terminal
if not toggleterm.active then
  return
end

toggleterm.open_mapping = [[<c-\>]]
toggleterm.direction = "float"
toggleterm.float_opts = {
  -- border = "curved",
  -- https://github.com/akinsho/toggleterm.nvim/issues/61
  winblend = 0,
  highlights = {
    border = "Normal",
    background = "Normal",
  },
}

toggleterm.on_config_done = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({ cmd = "lazygit" })

  -- NOTE: need to install lazygit first
  function TOGGLE_LAZYGIT()
    lazygit:toggle()
  end
end
