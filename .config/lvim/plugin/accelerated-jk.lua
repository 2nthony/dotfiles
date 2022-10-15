local status_accelerated_jk_ok = pcall(require, "accelerated-jk")
if not status_accelerated_jk_ok then
  return
end

vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
