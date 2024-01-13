return {
  { import = "plugins.extras.coding.autopairs" },
  { import = "plugins.extras.coding.comment" },
  { import = "plugins.extras.coding.load-vscode-snippets" },

  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter" },
    opts = function(_, opts)
      opts.completion.keyword_length = 1

      opts.formatting.fields = { "kind", "abbr", "menu" }
      opts.formatting.format = function(_, item)
        local icons = require("lazyvim.config").icons.kinds
        if icons[item.kind] then
          item.kind = icons[item.kind]
        end
        return item
      end

      -- set max item count for nvim_lsp, increase performance
      for _, source in ipairs(opts.sources) do
        if source.name == "nvim_lsp" then
          source.max_item_count = 50
          break
        end
      end
    end,
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
      { "<leader>cj", ":TSJToggle<CR>", desc = "Code splitting / joining blocks", silent = true },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
      max_join_length = 999,
    },
  },
}
