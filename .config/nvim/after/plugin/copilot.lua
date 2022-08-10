-- https://github.com/zbirenbaum/copilot.lua

local status_copilot_ok, copilot = pcall(require, 'copilot')
if not status_copilot_ok then
  return
end


if vim.g.loaded_copilot then
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true

  vim.cmd([[
    autocmd BufEnter * let b:copilot_enabled = v:false
  ]])
end

copilot.setup({
  ft_disable = { "markdown" }
})
