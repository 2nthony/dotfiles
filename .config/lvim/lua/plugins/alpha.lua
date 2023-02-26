local ok = pcall(require, "alpha")
if not ok then
  return
end

local icons = lvim.icons
local alpha = lvim.builtin.alpha

alpha.dashboard.section.header.val = " "

alpha.dashboard.section.footer.val = " "

alpha.dashboard.section.buttons.entries = {
  { "f", icons.ui.FindFile .. "  Find File",       "<CMD>Telescope find_files<CR>" },
  { "r", icons.ui.History .. "  Restore sessions", ":lua require('persistence').load()<cr>" },
  {
    "c",
    lvim.icons.ui.Gear .. "  Configuration",
    "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
  },
  { "q", (icons.ui.Quit or icons.ui.SignOut) .. "  Quit", "<CMD>quit<CR>" },
}
