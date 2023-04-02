-- https://github.com/glepnir/lspsaga.nvim
local icons = require("config.icons")
local icons_kinds = icons.get("kinds", { "space" })
local icons_ui = icons.get("ui")
local float = require("util.opts").float

return {
  "glepnir/lspsaga.nvim",
  lazy = true,
  event = { "BufReadPost" },
  cmd = { "Lspsaga" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
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
      expand = icons_ui.ChevronRight,
      collapse = icons_ui.ChevronDown,
      kind = {
        ["Array"] = { icons_kinds.Array, "Type" },
        ["Function"] = { icons_kinds.Function, "Function" },
        ["Interface"] = { icons_kinds.Interface, "Interface" },
        ["Object"] = { icons_kinds.Object, "Type" },
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
      enable = false,
      enable_in_insert = false,
    },
    -- breadcrumbs
    -- https://github.com/glepnir/lspsaga.nvim#lspsaga-symbols-in-winbar
    symbol_in_winbar = {
      separator = " " .. icons_ui.ChevronRight .. " ",
      color_mode = false,
    },
    beacon = {
      enable = false,
    },
    diagnostic = {
      on_insert = false,
      -- extend_relatedInformation = true, -- not working
    },
  },
}
