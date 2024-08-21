return {
  {
    "yetone/avante.nvim",
    keys = {
      { "<leader>aa", desc = "Toggle (Avante)" },
      { "<leader>ar", desc = "Refresh (Avante)" },
      { "<leader>ae", desc = "Edit (Avante)" },
    },
    build = "make",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", group = "+ai" },
      },
    },
  },
}
