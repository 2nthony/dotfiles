-- continuous comment next line
-- issue in https://github.com/LunarVim/LunarVim/issues/3237
-- fixed in https://github.com/LunarVim/LunarVim/pull/3278
-- vim.api.nvim_clear_autocmds { pattern = "*", group = "_format_options" }

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})
