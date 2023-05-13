local has = require("lazyvim.util").has

return {
  { "catppuccin", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  {
    "2nthony/vitesse.nvim",
    lazy = true,
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    opts = {
      reverse_visual = true,
      dim_nc = true,
      -- transparent_background = false,
      -- transparent_float_background = false,
      cmp_cmdline_disable_search_highlight_group = true,
    },
  },
  {
    "LazyVim",
    opts = {
      colorscheme = "vitesse",
    },
  },
  {
    "bufferline.nvim",
    opts = function(_, opts)
      if has("vitesse.nvim") then
        opts.options.separator_style = "slant"
        opts.highlights = require("vitesse.features.bufferline.slant").highlights
      end
    end,
  },
}
