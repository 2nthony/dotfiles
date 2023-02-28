-- general
-- https://github.com/rmagatti/auto-session

-- https://github.com/rmagatti/auto-session/issues/176#issuecomment-1278384005
local wipeout_empty_buffers = function()
  local buffers = vim.api.nvim_list_bufs()
  for _, buffer in ipairs(buffers) do
    if vim.api.nvim_buf_get_name(buffer) == "" then
      vim.api.nvim_command("bwipeout! " .. buffer)
    end
  end
end

return {
  "rmagatti/auto-session",
  init = function()
    -- https://github.com/rmagatti/auto-session#recommended-sessionoptions-config
    -- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
    vim.o.sessionoptions = "curdir,folds,help,tabpages,winsize,winpos,terminal"
  end,
  config = {
    log_level = "error",
    pre_save_cmds = {
      wipeout_empty_buffers,
      "NvimTreeClose",
    },
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
