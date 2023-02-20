-- LSP
-- https://github.com/glepnir/lspsaga.nvim

local float_opts = require("utils.float-opts")

return {
  'glepnir/lspsaga.nvim',
  event = "BufRead",
  config = {
    ui = {
      border = float_opts.border,
      winblend = float_opts.winblend,
      colors = {
        normal_bg = "none",
        title_bg = "none",
      }
    },
    outline = {
      keys = {
        jump = "<cr>"
      }
    },
    finder = {
      edit = { "o", "<cr>" }
    },
    lightbulb = {
      enable_in_insert = false,
    },
    -- breadcrumbs
    -- https://github.com/glepnir/lspsaga.nvim#lspsaga-symbols-in-winbar
    symbol_in_winbar = {},
  }
}
