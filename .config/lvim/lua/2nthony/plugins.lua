-- enable builtin plugins
lvim.builtin.terminal.active = true -- toggleterm.nvim
lvim.builtin.cmp.cmdline.enable = true

-- disable builtin plugins
lvim.builtin.alpha.active = false -- alpha-nvim
lvim.builtin.illuminate.active = false
lvim.builtin.project.active = false
lvim.builtin.breadcrumbs.active = false
lvim.builtin.indentlines.active = false
lvim.builtin.lir.active = false

require("plugins.bufferline")
require("plugins.nvim-tree")
require("plugins.toggleterm")
require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.lspconfig")
require("plugins.cmp")
require("plugins.which-key")

-- extra plugins
lvim.plugins = {
  -- general
  { "folke/todo-comments.nvim" },
  { "rmagatti/auto-session" },
  require("plugins.noice"),
  require("plugins.markdown-preview"),

  -- lsp
  require("plugins.lspsaga"),

  -- theme
  require("plugins.vitesse"),

  -- navigation
  { "windwp/nvim-spectre" },
  { "ggandor/leap.nvim" },

  -- highlight
  { 'norcalli/nvim-colorizer.lua' }, -- highlight HEX color
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
    config = {
      root_key = "sr",
    },
  }
}
