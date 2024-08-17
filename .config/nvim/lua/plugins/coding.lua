return {
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  { import = "lazyvim.plugins.extras.coding.neogen" },
  { import = "plugins.extras.coding.autopairs" },
  { import = "plugins.extras.coding.comment" },

  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    opts = {
      fields = { "kind", "abbr", "menu" },
    },
  },
  {
    "hrsh7th/cmp-cmdline",
    lazy = true,
    event = { "CmdlineEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = {
      completion = {
        completeopt = "menu,menuone,noselect",
      },
      formatting = {
        fields = { "abbr", "menu" },
      },
      types = {
        {
          type = ":",
          sources = {
            { name = "path" },
            { name = "cmdline" },
          },
        },
        {
          type = { "/", "?" },
          sources = {
            { name = "buffer" },
          },
        },
      },
    },
    config = function(_, opts)
      local cmp = require("cmp")

      for _, opt in ipairs(opts.types) do
        cmp.setup.cmdline(
          opt.type,
          vim.tbl_extend("force", opts, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(opt.sources),
          })
        )
      end
    end,
  },

  {
    "Wansmer/treesj",
    keys = {
      { "<leader>cjj", ":TSJToggle<CR>", desc = "Code splitting / joining blocks", silent = true },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
      max_join_length = 999,
    },
  },

  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    opts = {
      treesitter = { suffix = "n" },
    },
  },
}
