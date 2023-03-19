-- https://github.com/lewis6991/gitsigns.nvim
-- https://www.lazyvim.org/plugins/editor#gitsignsnvim

return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  cmd = { "Gitsigns" },
  opts = function(_, opts)
    return {
      signs = opts.signs,
      current_line_blame = true,
    }
  end,
}
