-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = require("util.keymap").map
local ok, keymaps = pcall(require, "keymaps")
if ok then
  local generals = keymaps.generals

  for _, keymap in ipairs(generals) do
    local mode = keymap.mode or "n"
    local lhs = keymap[1]
    local rhs = keymap[2]
    local opts = {
      desc = keymap.desc,
      remap = keymap.remap,
    }

    map(mode, lhs, rhs, opts)
  end
end
