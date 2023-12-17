local has = require("lazyvim.util").has

return {
  { "catppuccin", enabled = false },

  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    opts = {
      reverse_visual = true,
      dim_nc = true,
      cmp_cmdline_disable_search_highlight_group = true,
      diagnostic_virtual_text_background = true,
    },
  },
  {
    "LazyVim",
    opts = function(_, opts)
      if has("vitesse.nvim") then
        opts.colorscheme = "vitesse"
      end
    end,
  },
}
