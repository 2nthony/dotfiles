return {
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit", "NeogitResetState" },
    opts = {},
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
