local ok, vitesse = pcall(require, "vitesse")
if not ok then
  return
end

if vim.g.colorscheme ~= "vitesse" then
  return
end

vitesse.setup {
  comment_italics = true,
}

vim.cmd('colorscheme vitesse')
