local M = {}

M.map = function(mode, lhs, rhs, opts)
  rhs = rhs or "<nop>"
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

M.del = function(modes, lhs, opts)
  vim.keymap.del(modes, lhs, opts)
end

return M
