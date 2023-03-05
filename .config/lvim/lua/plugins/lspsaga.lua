-- LSP
-- https://github.com/glepnir/lspsaga.nvim

local float_opts = require("utils.float-opts")

return {
  'glepnir/lspsaga.nvim',
  event = "BufRead",
  config = {
    request_timeout = 5000,
    scroll_preview = {
      scroll_down = "<C-d>",
      scroll_up = "<C-f>",
    },
    ui = {
      border = float_opts.border,
      winblend = float_opts.winblend,
      colors = {
        normal_bg = "none",
        title_bg = "none",
      },
      kind = {
            ['Array'] = { lvim.icons.kind.Array .. ' ', 'Type' },
            ['Function'] = { lvim.icons.kind.Function .. ' ', 'Function' },
            ['Interface'] = { lvim.icons.kind.Interface .. ' ', 'Interface' },
            ['Object'] = { lvim.icons.kind.Object .. ' ', 'Type' },
      },
    },
    outline = {
      keys = {
        jump = "<cr>"
      }
    },
    finder = {
      keys = {
        vsplit = "v",
        split = "s",
        quit = { "q", "<esc>" },
        edit = { "<cr>" },
        close_in_preview = "q",
      }
    },
    definition = {
      edit = "<cr>",
      vsplit = "<C-v>",
      split = "<C-s>",
      tabe = "<C-t>",
    },
    lightbulb = {
      enable_in_insert = false,
    },
    -- breadcrumbs
    -- https://github.com/glepnir/lspsaga.nvim#lspsaga-symbols-in-winbar
    symbol_in_winbar = {
      separator = " " .. lvim.icons.ui.ChevronShortRight .. " ",
      color_mode = false,
    },
    beacon = {
      enable = false,
    },
  }
}
