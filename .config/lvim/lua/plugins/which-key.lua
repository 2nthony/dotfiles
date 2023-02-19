local float_opts = require("utils.float-opts")
local which_key = lvim.builtin.which_key

which_key.setup.window.border = float_opts.border
which_key.setup.window.winblend = float_opts.winblend
which_key.setup.window.padding = { 0, 0, 0, 0 }
