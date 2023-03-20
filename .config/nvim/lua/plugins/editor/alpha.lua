-- https://github.com/goolord/alpha-nvim

local icons = require("util.icon")

return {
  "goolord/alpha-nvim",
  opts = function(_, dashboard)
    dashboard.section.header.val = " "
    dashboard.section.buttons.val = {
      dashboard.button("n", icons.ui.NewFile .. "  New File", ":ene! <cr>"),
      dashboard.button("ff", icons.ui.FindFile .. "  Find File", ":Telescope find_files <cr>"),
      dashboard.button(
        "fe",
        icons.ui.FileTree .. "  File Explorer",
        ":lua require('neo-tree.command').execute({ toggle = true }) <cr>"
      ),
      dashboard.button("s", icons.ui.History .. "  Restore sessions", ":lua require('persistence').load()<cr>"),
      dashboard.button("c", icons.ui.Gear .. "  Config", ":e $MYVIMRC <cr>"),

      dashboard.button("l", icons.misc.Lazy .. "  Lazy", ":Lazy<cr>"),
      dashboard.button("m", icons.ui.Package .. "  Mason", ":Mason<cr>"),
      dashboard.button("q", icons.ui.Close .. "  Quit", ":q<cr>"),
      dashboard.button("x", icons.ui.SignOut .. "  Exit (Quit all)", ":qa<cr>"),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButton"
      button.opts.hl_shortcut = "AlphaShortcut"
    end

    dashboard.opts.layout[1].val = 2

    return dashboard
  end,
}
