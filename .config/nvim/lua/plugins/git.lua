return {
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit", "NeogitResetState" },
    keys = {
      { "<leader>gn", ":Neogit<cr>", desc = "Neogit" },
    },
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

  {
    "which-key.nvim",
    lazy = false,
    opts = {
      spec = {
        { "<leader>gd", group = "+diffview" },
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    keys = {
      { "<leader>gdo", ":DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gdc", ":DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>gdf", ":DiffviewFocusFiles<cr>", desc = "Diffview Focus files" },
      { "<leader>gdh", ":DiffviewFileHistory<cr>", desc = "Diffview File history" },
      { "<leader>gdt", ":DiffviewToggleFiles<cr>", desc = "Diffview Toggle files" },
      { "<leader>gdr", ":DiffviewRefresh<cr>", desc = "Diffview Refresh" },
    },
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewLog",
      "DiffviewRefresh",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
    opts = function()
      local keymap_q_close = { "n", "q", ":DiffviewClose<cr>", { desc = "Diffview Close" } }

      return {
        enhanced_diff_hl = true,
        keymaps = {
          view = {
            keymap_q_close,
          },
          file_panel = {
            keymap_q_close,
          },
          file_history_panel = {
            keymap_q_close,
          },
        },
      }
    end,
  },
}
