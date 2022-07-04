-- https://github.com/MattesGroeger/vim-bookmarks

if vim.g.bookmark_sign then
  vim.cmd[[
    let g:bookmark_no_default_key_mappings = 1

    unmap mkk
    unmap mjj

    function! BookmarkMapKeys()
        nmap mm :BookmarkToggle<CR>
        nmap mi :BookmarkAnnotate<CR>
        nmap mn :BookmarkNext<CR>
        nmap mp :BookmarkPrev<CR>
        nmap ma :BookmarkShowAll<CR>
        nmap mc :BookmarkClear<CR>
        nmap mx :BookmarkClearAll<CR>
    endfunction

    function! BookmarkUnmapKeys()
        unmap mm
        unmap mi
        unmap mn
        unmap mp
        unmap ma
        unmap mc
        unmap mx
    endfunction

    autocmd BufEnter * :call BookmarkMapKeys()
    autocmd BufEnter NvimTree* :call BookmarkUnmapKeys()
  ]]
end
