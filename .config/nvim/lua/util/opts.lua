local M = {}

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
