-- https://github.com/glepnir/lspsaga.nvim

return {
  "glepnir/lspsaga.nvim",
  event = { "BufReadPre" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = function()
    local icons = require("lazyvim.config").icons
    local float = require("util.opts").float

    return {
      request_timeout = 5000,
      scroll_preview = {
        scroll_down = "<C-d>",
        scroll_up = "<C-f>",
      },
      ui = {
        border = float.border,
        winblend = float.winblend,
        colors = {
          normal_bg = "none",
          title_bg = "none",
        },
        expand = icons.ui.ChevronShortRight,
        collapse = icons.ui.ChevronShortDown,
        kind = {
          ["Array"] = { icons.kinds.Array, "Type" },
          ["Function"] = { icons.kinds.Function, "Function" },
          ["Interface"] = { icons.kinds.Interface, "Interface" },
          ["Object"] = { icons.kinds.Object, "Type" },
        },
      },
      outline = {
        keys = {
          jump = "<cr>",
        },
      },
      finder = {
        keys = {
          vsplit = "v",
          split = "s",
          quit = { "q", "<esc>" },
          edit = { "<cr>" },
          close_in_preview = "q",
        },
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
        separator = " " .. icons.ui.ChevronShortRight .. " ",
        color_mode = false,
      },
      beacon = {
        enable = false,
      },
    }
  end,
}
