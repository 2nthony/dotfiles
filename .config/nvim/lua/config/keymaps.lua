-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local lazykeys = require("util.keymap").lazykeys
local ok, keymaps = pcall(require, "keymaps")
if ok then
  local generals = keymaps.generals
  lazykeys(generals)
end
