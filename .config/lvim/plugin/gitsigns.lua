-- builtin
-- https://github.com/lewis6991/gitsigns.nvim
-- https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/core/gitsigns.lua

local ok = pcall(require, "gitsigns")
if not ok then
  return
end

local float_opts = require("utils.float-opts")

local gitsigns = lvim.builtin.gitsigns

gitsigns.opts.current_line_blame = true
gitsigns.opts.preview_config.border = float_opts.border
gitsigns.opts.preview_config.style = float_opts.style
