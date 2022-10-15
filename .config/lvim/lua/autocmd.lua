-- continuous comment next line
-- https://github.com/LunarVim/LunarVim/issues/3237
vim.api.nvim_clear_autocmds { pattern = "*", group = "_format_options" }

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})
