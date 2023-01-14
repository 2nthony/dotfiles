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
    auto_close = false,
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
}
