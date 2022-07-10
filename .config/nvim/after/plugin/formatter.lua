local status_formatter_ok, formatter = pcall(require, 'formatter')
if not status_formatter_ok then
  return
end

formatter.setup({
  filetype = {
    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },
    typescript = {
      require('formatter.filetypes.typescript').prettier,
    },
  }
})

vim.cmd[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]]
