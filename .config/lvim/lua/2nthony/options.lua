local float_opts = require("utils.float-opts")
local opt = vim.opt

opt.backup = false
opt.mouse = "" -- disable mouse
opt.shell = 'fish'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.showcmd = true
opt.expandtab = true
opt.scrolloff = 10
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.wrap = false -- No Wrap lines
opt.swapfile = false
opt.backspace = { 'start', 'eol', 'indent' }
opt.undofile = true -- enable persistent undo, similar to undotree
opt.inccommand = 'split'
opt.laststatus = 2
opt.breakindent = true
opt.whichwrap = "" -- don't move cursor to prev/next line via any key
opt.showmode = false

-- highlight
opt.cursorline = true
opt.termguicolors = true
opt.background = 'dark'

-- float
opt.wildoptions = 'pum'
opt.winblend = float_opts.winblend
opt.pumblend = float_opts.pumblend
opt.pumheight = 10
