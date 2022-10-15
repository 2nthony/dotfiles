-- builtin
-- https://github.com/lewis6991/gitsigns.nvim

local gitsigns = lvim.builtin.gitsigns

if not gitsigns.active then
  return
end

gitsigns.opts.current_line_blame = true
