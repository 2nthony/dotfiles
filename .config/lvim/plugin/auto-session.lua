-- https://github.com/rmagatti/auto-session

local ok, auto_session = pcall(require, 'auto-session')
if not ok then
  return
end

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

auto_session.setup {
  log_level = "error",
  pre_save_cmds = { "tabdo NvimTreeClose" },
  auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
  auto_session_suppress_dirs = {
    "~/",
    "~/Downloads",
    "/",
  }
}
