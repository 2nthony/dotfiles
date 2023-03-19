local ok = pcall(require, "alpha")
if not ok then
  return
end

local icons = lvim.icons
local alpha = lvim.builtin.alpha

alpha.dashboard.section.header.val = " "

alpha.dashboard.section.footer.val = " "

alpha.dashboard.section.buttons.entries = {
  { "n",  icons.ui.NewFile .. "  New File",         "<CMD>ene!<CR>" },
  { "ff", icons.ui.FindFile .. "  Find File",       "<CMD>Telescope find_files<CR>" },
  { "fe", icons.ui.FolderOpen .. "  File Explorer", "<CMD>NvimTreeToggle<CR>" },
  { "s",  icons.ui.History .. "  Restore sessions", ":RestoreSession<cr>" },
  {
    "c",
    lvim.icons.ui.Gear .. "  Configuration",
    "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
  },
  { "q", (icons.ui.Quit or icons.ui.SignOut) .. "  Quit", "<CMD>quit<CR>" },
}
