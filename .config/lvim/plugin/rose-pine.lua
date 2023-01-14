-- https://github.com/rose-pine/neovim

if lvim.colorscheme ~= "rose-pine" then
  return
end

local ok, rose_pine = pcall(require, "rose-pine")
if not ok then
  return
end

rose_pine.setup {
  dark_variant = "moon",
  disable_background = true,
  disable_float_background = true,
  disable_italics = true,
}
