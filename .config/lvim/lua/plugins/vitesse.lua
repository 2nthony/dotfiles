-- https://github.com/2nthony/vitesse.nvim

if lvim.colorscheme ~= "vitesse" then
  return
end

local ok, vitesse = pcall(require, "vitesse")
if not ok then
  return
end

vitesse.setup {
  reverse_visual = true,
}

vim.cmd("colorscheme vitesse")
