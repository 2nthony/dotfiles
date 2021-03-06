local status_auto_session_ok, auto_session = pcall(require, 'auto-session')
if not status_auto_session_ok then
  return
end

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

auto_session.setup{
  pre_save_cmds = { "tabdo NvimTreeClose" },
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
}

