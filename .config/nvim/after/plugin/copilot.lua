-- https://github.com/zbirenbaum/copilot.lua

local status_copilot_ok, copilot = pcall(require, 'copilot')
if not status_copilot_ok then
  return
end

if vim.g.loaded_copilot then
  -- vim.cmd([[
  --   autocmd BufEnter * let b:copilot_enabled = v:false
  -- ]])

  vim.cmd([[
    imap <silent><script><expr> <s-tab> copilot#Accept("\<CR>")
    autocmd BufEnter * let g:copilot_no_tab_map = v:true
  ]])
end

-- copilot.setup{}
