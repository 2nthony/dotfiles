-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.backup = false
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.breakindent = true
opt.formatoptions:append({ "r" })
opt.mouse = ""
opt.relativenumber = false
opt.diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience"
