return {
  {
    "tpope/vim-fugitive",
    cmd = "G",
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    cmd = { "Gitsigns" },
    opts = {
      current_line_blame = true,
    },
  },
}
