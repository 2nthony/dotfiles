vim.g.ai_cmp = false

return {
  { import = "lazyvim.plugins.extras.ai.codeium" },

  {
    "which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", group = "+ai" },
      },
    },
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    opts = {
      mappings = {
        submit = {
          insert = "<C-CR>",
        },
      },
    },
    build = "make",
    dependencies = {
      "folke/snacks.nvim",
      "stevearc/dressing.nvim",
      "ibhagwan/fzf-lua",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
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
    "yetone/avante.nvim",
    opts = {
      provider = "openai",
      providers = {
        openai = {
          model = "deepseek-chat",
          endpoint = "https://api.deepseek.com",
        },
      },
      windows = {
        width = 40,
      },
    },
  },
}
