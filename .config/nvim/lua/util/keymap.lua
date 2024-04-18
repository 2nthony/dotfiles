local M = {}

M.map = function(mode, lhs, rhs, opts)
  -- local keys = require("lazy.core.handler").handlers.keys
  -- ---@cast keys LazyKeysHandler
  -- -- do not create the keymap if a lazy keys handler exists
  -- if not keys.active[keys.parse({ lhs, mode = mode }).id] then
  -- end

  rhs = rhs or "<nop>"
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.del = function(modes, lhs, opts)
  vim.keymap.del(modes, lhs, opts)
end

---@param key LazyKeys
M.lazykey = function(key)
  local mode = key.mode or "n"
  local lhs = key[1]
  local rhs = key[2]

  -- the rest of the key is the options
  local opts = vim.tbl_extend("force", {}, key)
  opts.mode = nil
  opts[1] = nil
  opts[2] = nil

  -- if `nil` then delete
  if rhs == nil then
    M.del(mode, lhs, opts)
  else
    M.map(mode, lhs, rhs, opts)
  end
end

---@param keys LazyKeys[]
M.lazykeys = function(keys)
  for _, key in ipairs(keys) do
    M.lazykey(key)
  end
end

return M
