-- https://www.lazyvim.org/plugins/lsp#nvim-lspconfig

vim.lsp.set_log_level(vim.log.levels.ERROR)

return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "plugins.extras.linting.eslint" },
  { import = "plugins.extras.lang.vue" },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    opts = {
      servers = {
        unocss = {},
      },
    },
  },

  -- lspsaga
  {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    -- event = { "LspAttach" },
    cmd = { "Lspsaga" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      ui = {
        title = false,
      },
      outline = {
        keys = {
          expand_or_jump = "<cr>",
        },
      },
      finder = {
        keys = {
          vsplit = "v",
          split = "s",
          quit = { "q", "<esc>" },
          edit = { "<cr>" },
          close_in_preview = "q",
        },
      },
      definition = {
        edit = "<cr>",
        vsplit = "<C-v>",
        split = "<C-s>",
        tabe = "<C-t>",
      },
      lightbulb = {
        enable = false,
        enable_in_insert = false,
      },
      -- breadcrumbs
      -- https://github.com/glepnir/lspsaga.nvim#lspsaga-symbols-in-winbar
      symbol_in_winbar = {
        enable = false,
      },
      beacon = {
        enable = false,
      },
    },
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      log_level = vim.log.levels.ERROR,
      ensure_installed = {
        "stylua",
      },
    },
  },

  -- lsp settings
  {
    "tamago324/nlsp-settings.nvim",
    cmd = "LspSettings",
    opts = {},
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.log_level = "error"

      table.insert(
        opts.sources,
        nls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file_matches(".prettier*")
          end,
        })
      )
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = { "LspAttach" },
    opts = {
      hint_prefix = "",
    },
  },
}
