-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local skip_features_filetypes = require("util.ft").skip_features_filetypes

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = ".*rc",
  command = "setfiletype json",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = skip_features_filetypes,
  callback = function()
    -- cmp
    local ok, cmp = pcall(require, "cmp")
    if ok then
      cmp.setup.buffer({ enabled = false })
    end

    -- mini.indentscope
    vim.b.miniindentscope_disable = true
  end,
})
