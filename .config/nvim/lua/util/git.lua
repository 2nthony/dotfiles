local has = require("lazyvim.util").has
local float = require("util.opts").float

local M = {}

M.lazygit = function()
  if not has("toggleterm.nvim") then
    vim.notify("toggleterm not found!", "error")
    return
  end

  local size = float.get_size("full")
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    -- direction = toggleterm.direction,
    -- float_opts = toggleterm.float_opts,
    float_opts = {
      width = size.width,
      height = size.height,
      border = "none",
    },
  })

  lazygit:toggle()
end

return M
