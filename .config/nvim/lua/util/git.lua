local has = require("lazyvim.util").has
local float = require("util.opts").float

local M = {}

---@param termArgs? TermCreateArgs
M.lazygit = function(termArgs)
  if not has("toggleterm.nvim") then
    vim.notify("toggleterm not found!", "error")
    return
  end

  local size = float.get_size("full")
  local Terminal = require("toggleterm.terminal").Terminal

  local lazygit = Terminal:new(vim.tbl_extend("force", termArgs or {}, {
    cmd = "lazygit",
    hidden = true,
    float_opts = {
      width = size.width,
      height = size.height,
      border = "none",
    },
  }))

  lazygit:toggle()
end

return M
