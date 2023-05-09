-- https://github.com/mg979/vim-visual-multi

return {
  "mg979/vim-visual-multi",
  lazy = true,
  init = function()
    -- https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
    vim.cmd([[
      let g:VM_default_mappings = 0
      let g:VM_maps = {}
      let g:VM_maps["Find Under"] = ''
      let g:VM_maps["Find Subword Under"] = ''
    ]])
  end,
}
