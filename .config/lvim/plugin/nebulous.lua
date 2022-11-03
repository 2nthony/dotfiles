-- theme
-- https://github.com/Yagua/nebulous.nvim

local ok, nebulous = pcall(require, "nebulous")
if not ok then
  return
end

if lvim.colorscheme ~= "nebulous" then
  return
end

nebulous.setup {
  variant = "fullmoon",
  disable = {
    background = true,
    terminal_colors = true,
  },
  italic = {
    comments  = true,
    keywords  = false,
    functions = false,
    variables = true,
  },
}

vim.cmd("colorscheme nebulous")
