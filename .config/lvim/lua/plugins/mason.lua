-- builtin
-- https://github.com/williamboman/mason.nvim

local float_opts = require('utils.float-opts')
local mason = lvim.builtin.mason

mason.log_level = vim.log.levels.ERROR

mason.ui.border = float_opts.border
