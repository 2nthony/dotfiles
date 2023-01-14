-- enable builtin plugins
lvim.builtin.terminal.active = true -- toogleterm.nvim
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

-- extra plugins
lvim.plugins = {
  -- general
  { "folke/todo-comments.nvim" },
  { "wakatime/vim-wakatime" },
  { "tpope/vim-surround" },
  { "rmagatti/auto-session" },
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- lsp
  { 'glepnir/lspsaga.nvim' },
  { 'onsails/lspkind-nvim' },

  -- cmp
  { 'hrsh7th/cmp-cmdline' },

  -- theme
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim"
    },
    config = function()
      require("plugins.vitesse")
    end
  },

  -- navigation
  { "windwp/nvim-spectre" },
  { "ggandor/leap.nvim" },

  -- highlight
  { 'norcalli/nvim-colorizer.lua' }, -- highlight HEX color

  -- treesitter
  { "windwp/nvim-ts-autotag" },

  -- telescope
  { "folke/trouble.nvim" },

  -- git
  { "sindrets/diffview.nvim" },
}
