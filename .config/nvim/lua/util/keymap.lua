local M = {}

M.set = function(mode, lhs, rhs, opts)
  rhs = rhs or "<nop>"
  opts = opts or {}
  opts.silent = opts.silent ~= false

  vim.keymap.set(mode, lhs, rhs, opts)
end

M.del = function(modes, lhs, opts)
  vim.keymap.del(modes, lhs, opts)
end

---@param key LazyKeysSpec
M.map = function(key)
  local mode = key.mode or "n"
  local lhs = key[1]
  local rhs = key[2]

  -- the rest of the key is the options
  local opts = vim.tbl_extend("force", {}, key)
  opts.mode = nil
  opts[1] = nil
  opts[2] = nil

  -- if `nil` then map to nop
  if rhs == nil then
    rhs = "<nop>"
  end

  M.set(mode, lhs, rhs, opts)
end

---@param keys LazyKeysSpec[]
M.maps = function(keys)
  for _, key in ipairs(keys) do
    M.map(key)
  end
end

return M
