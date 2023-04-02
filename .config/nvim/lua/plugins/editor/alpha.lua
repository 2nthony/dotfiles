-- https://github.com/goolord/alpha-nvim
-- https://github.com/ayamir/nvimdots/blob/main/lua/modules/configs/ui/alpha.lua

return {
  "goolord/alpha-nvim",
  lazy = true,
  event = function()
    return { "BufWinEnter" }
  end,
  opts = function(_, dashboard)
    local icons = require("lazyvim.config").icons
    local logo = require("util.alpha").logo

    dashboard.section.header.val = logo.empty

    dashboard.section.buttons.val = {
      dashboard.button("n", icons.ui.NewFile .. " New File", ":ene! <cr>"),
      dashboard.button("ff", icons.ui.FindFile .. " Find File", ":Telescope find_files <cr>"),
      dashboard.button(
        "fe",
        icons.ui.FileTree .. " File Explorer",
        ":lua require('neo-tree.command').execute({ toggle = true }) <cr>"
      ),
      dashboard.button("s", icons.ui.History .. " Restore sessions", ":lua require('persistence').load()<cr>"),
      dashboard.button("l", icons.misc.Lazy .. " Lazy", ":Lazy<cr>"),
      dashboard.button("m", icons.ui.Package .. " Mason", ":Mason<cr>"),
      dashboard.button("c", icons.ui.Gear .. " Config", ":e $MYVIMRC <cr>"),
      dashboard.button("q", icons.ui.SignOut .. " Quit", ":q<cr>"),
      dashboard.button("x", icons.ui.CloseAll .. " Exit (Quit all)", ":qa<cr>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButton"
      button.opts.hl_shortcut = "AlphaShortcut"
    end

    local head_butt_padding = 2
    local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
    local header_padding = math.max(0, math.ceil((vim.fn.winheight(0) - occu_height) * 0.25))
    local foot_butt_padding = 1

    dashboard.opts.layout = {
      { type = "padding", val = header_padding },
      dashboard.section.header,
      { type = "padding", val = head_butt_padding },
      dashboard.section.buttons,
      { type = "padding", val = foot_butt_padding },
      dashboard.section.footer,
    }

    return dashboard
  end,
  config = function(_, dashboard)
    require("alpha").setup(dashboard.opts)
  end,
}
