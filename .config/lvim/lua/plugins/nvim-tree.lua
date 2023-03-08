-- builtin
-- https://github.com/kyazdani42/nvim-tree.lua

local ok = pcall(require, "nvim-tree")
if not ok then
  return
end

local float_opts = require("utils.float-opts")
local nvim_tree = lvim.builtin.nvimtree

nvim_tree.setup.view.mappings.list = {
  { key = { "<CR>", "o" }, action = "edit" },
  { key = "O",             action = "cd" },
  { key = "S",             action = "live_filter" },
  { key = "F",             action = "clear_live_filter" },
  { key = "<C-s>",         action = "split" },
  { key = "?",             action = "toggle_help" },

  -- reset
  { key = "s",             action = "" },
  { key = "f",             action = "" },
  { key = "<C-x>",         action = "" },
  { key = "g?",            action = "" },
}

nvim_tree.setup.live_filter = {
  prefix = "[Search]: ",
  always_show_folders = false,
}

nvim_tree.setup.git.ignore = true
nvim_tree.setup.update_focused_file.enable = false

-- https://github.com/nvim-tree/nvim-tree.lua/issues/1178#issuecomment-1101819983
nvim_tree.setup.filters.custom = { "^\\.git$" }

-- use normal size icons
nvim_tree.setup.diagnostics.icons.hint = lvim.icons.diagnostics.Hint
nvim_tree.setup.diagnostics.icons.info = lvim.icons.diagnostics.Info
nvim_tree.setup.diagnostics.icons.warning = lvim.icons.diagnostics.Warning
nvim_tree.setup.diagnostics.icons.error = lvim.icons.diagnostics.Error

nvim_tree.setup.view.float.enable = false
if nvim_tree.setup.view.float.enable then
  nvim_tree.setup.view.float.quit_on_focus_loss = true
  nvim_tree.setup.view.float.open_win_config.width = 35
  nvim_tree.setup.view.float.open_win_config.row = 0
  nvim_tree.setup.view.float.open_win_config.col = 0
  nvim_tree.setup.view.float.open_win_config.border = float_opts.border

  -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#center-a-floating-nvim-tree-window
  local open_win_config = nvim_tree.setup.view.float.open_win_config
  nvim_tree.setup.view.float.open_win_config = function()
    local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
    local window_h_int = math.floor(screen_h)
    return vim.tbl_extend("force", {}, open_win_config, {
      height = window_h_int,
    })
  end
end
