-- https://github.com/zbirenbaum/copilot.lua

local status_copilot_ok, copilot = pcall(require, 'copilot')
if not status_copilot_ok then
  return
end

copilot.setup{}
