local M = {}

M.float = {
  winblend = vim.o.winblend,
  pumblend = vim.o.pumblend,
  border = "rounded",
  style = "minimal",
  size = {
    width = 0.8,
    height = 0.8,
  },
}

---@param width 'full'|number
---@param height? 'full'|number
M.float.get_size = function(width, height)
  width = width or M.float.size.width
  height = height or width or M.float.size.width

  local size = {
    width = width,
    height = height,
  }

  if width == "full" then
    size.width = 100000
  end

  if height == "full" then
    size.height = 100000
  end

  return size
end

M.win = {
  winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
}

return M
