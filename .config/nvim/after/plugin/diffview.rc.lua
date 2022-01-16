if (not vim.g.diffview_nvim_loaded) then
  return
end

require'diffview'.setup{
  file_panel = {
    position = "top"
  }
}
