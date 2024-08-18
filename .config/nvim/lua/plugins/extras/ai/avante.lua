return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    opts = {
      provider = "openai",
      openai = {
        model = "gpt-4o-mini",
      },
    },
    build = "make",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      {
        "grapp-dev/nui-components.nvim",
        dependencies = {
          "MunifTanjim/nui.nvim",
        },
      },
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
        { "<leader>aa", desc = "Toggle (Avante)" },
        { "<leader>ar", desc = "Refresh (Avante)" },
        { "<leader>ae", desc = "Edit (Avante)" },
      },
    },
  },
}
