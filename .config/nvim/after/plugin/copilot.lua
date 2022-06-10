-- https://github.com/zbirenbaum/copilot.lua

local status_copilot_ok, copilot = pcall(require, 'copilot')
if not status_copilot_ok then
  return
end

if vim.g.loaded_copilot then
  vim.cmd([[
    autocmd BufEnter * let b:copilot_enabled = v:false
  ]])
end

copilot.setup{}
