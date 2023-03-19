local has = require("lazyvim.util").has

local M = {}

M.lazygit = function()
  if not has("toggleterm.nvim") then
    vim.notify("toggleterm not found!", "error")
    return
  end

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    -- direction = toggleterm.direction,
    -- float_opts = toggleterm.float_opts,
  })

  lazygit:toggle()
end

return M
