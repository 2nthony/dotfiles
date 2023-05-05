-- https://github.com/lewis6991/gitsigns.nvim
-- https://www.lazyvim.org/plugins/editor#gitsignsnvim

return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  cmd = { "Gitsigns" },
  opts = function(_, opts)
    local float = require("util.opts").float

    return {
      signs = opts.signs,
      current_line_blame = true,
      preview_config = {
        border = float.border,
        style = float.style,
      },
    }
  end,
}
