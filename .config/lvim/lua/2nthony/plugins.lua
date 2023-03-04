-- enable builtin plugins
lvim.builtin.terminal.active = true -- toggleterm.nvim
lvim.builtin.cmp.cmdline.enable = true
lvim.builtin.alpha.active = true    -- alpha-nvim

-- disable builtin plugins
lvim.builtin.illuminate.active = false
lvim.builtin.project.active = false
lvim.builtin.breadcrumbs.active = false
lvim.builtin.indentlines.active = false
lvim.builtin.lir.active = false

require("plugins.alpha")
require("plugins.bufferline")
require("plugins.nvim-tree")
require("plugins.toggleterm")
require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.lspconfig")
require("plugins.cmp")
require("plugins.which-key")
require("plugins.null-ls")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.luasnip")

-- extra plugins
lvim.plugins = {
  -- general
  { "folke/todo-comments.nvim" },
  require("plugins.noice"),
  require("plugins.markdown-preview"),
  require("plugins.auto-session"),
  require("plugins.visual-multi"),

  -- lsp
  require("plugins.lspsaga"),
  require("plugins.lspkind"),

  -- theme
  require("plugins.vitesse"),
  require("plugins.rose-pine"),

  -- navigation
  require("plugins.spectre"),
  require("plugins.leap"),

  -- highlight
  require("plugins.colorizer"),
  require("plugins.kdl"),

  -- treesitter
  { "windwp/nvim-ts-autotag" },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects", -- recommended
    },
  },

  -- telescope
  { "folke/trouble.nvim" },

  -- git
  require("plugins.diffview"),

  -- others
  require("plugins.wakatime"),
  {
    "roobert/surround-ui.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/which-key.nvim",
      "kylechui/nvim-surround",
    },
  }
}
