local is_windows = vim.loop.os_uname().version:match("Windows")
local path_separator = is_windows and "\\" or "/"

local M = {}

---@class PathUtils
---@field exists fun(filename: string): boolean
---@field join function(paths: ...): string
M.path = {
  exists = function(filename)
    local stat = vim.loop.fs_stat(filename)
    return stat ~= nil
  end,
  join = function(...)
    return table.concat(vim.tbl_flatten({ ... }), path_separator):gsub(path_separator .. "+", path_separator)
  end,
}

return M
