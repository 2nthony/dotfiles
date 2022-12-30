-- builtin
-- https://github.com/lewis6991/gitsigns.nvim

local ok = pcall(require, "gitsigns")
if not ok then
  return
end

local gitsigns = lvim.builtin.gitsigns

gitsigns.opts.current_line_blame = true
