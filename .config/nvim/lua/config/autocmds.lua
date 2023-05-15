-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = ".*rc",
  command = "setfiletype json",
})

-- cmp, disable in these filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "bigfile",
    "OverseerForm",
  },
  callback = function()
    local ok, cmp = pcall(require, "cmp")
    if ok then
      cmp.setup.buffer({ enabled = false })
    end
  end,
})
