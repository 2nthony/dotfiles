-- general
-- https://github.com/rmagatti/auto-session

return {
  "rmagatti/auto-session",
  init = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
  end,
  config = {
    log_level = "error",
    pre_save_cmds = { "tabdo NvimTreeClose" },
    auto_restore_enabled = false,
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
    auto_session_suppress_dirs = {
      "~/",
      "~/Downloads",
      "/",
    },
    bypass_session_save_file_types = {
      "alpha",
      "NvimTree",
    }
  }
}
