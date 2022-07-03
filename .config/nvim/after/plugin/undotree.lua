-- https://github.com/mbbill/undotree

if not vim.g.loaded_undotree then
  return
end

vim.cmd([[
  if has("persistent_undo")
   let target_path = expand('~/.cache/nvim/undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
  endif
]])
