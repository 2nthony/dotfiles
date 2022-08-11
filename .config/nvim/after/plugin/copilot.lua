-- https://github.com/zbirenbaum/copilot.lua

local status_copilot_ok, copilot = pcall(require, 'copilot')
if not status_copilot_ok then
  return
end


if vim.g.loaded_copilot then
  -- disable Copilot globally
  vim.g.copilot_enabled = false
end

copilot.setup({
  ft_disable = { "markdown" }
})
