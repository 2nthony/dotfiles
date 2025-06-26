-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

--- hide document symbols
vim.g.trouble_lualine = false
vim.g.lazyvim_check_order = false

local opt = vim.opt

opt.backup = false
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.breakindent = true
opt.formatoptions:append({ "r" })
-- opt.mouse = ""
opt.relativenumber = false
opt.diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience"
opt.splitkeep = "cursor"

opt.foldmethod = "expr"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
