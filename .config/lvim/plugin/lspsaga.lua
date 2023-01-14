-- LSP
-- https://github.com/glepnir/lspsaga.nvim

local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
  return
end

lspsaga.setup {
  ui = {
    border = "rounded",
    winblend = 0,
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
