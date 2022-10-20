-- enable builtin plugins
lvim.builtin.terminal.active = true -- toogleterm.nvim

-- disable builtin plugins
lvim.builtin.alpha.active = false -- alpha-nvim
lvim.builtin.notify.active = false
lvim.builtin.illuminate.active = false

-- extra plugins
lvim.plugins = {
  -- general
  { "folke/todo-comments.nvim" },
  { "wakatime/vim-wakatime" },
  { "tpope/vim-surround" },
  { "mbbill/undotree" },
  { "rainbowhxch/accelerated-jk.nvim" },
  { "rmagatti/auto-session" },
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },

  -- lsp
  { 'glepnir/lspsaga.nvim' },
  { 'onsails/lspkind-nvim' },

  -- cmp
  { 'hrsh7th/cmp-cmdline' },

  -- theme
  {
    'svrana/neosolarized.nvim',
    requires = {
      'tjdevries/colorbuddy.nvim'
    },
  },

  -- navigation
  { "phaazon/hop.nvim" },
  { "windwp/nvim-spectre" },

  -- highlight
  { 'norcalli/nvim-colorizer.lua' }, -- highlight HEX color

  -- treesitter
  { "windwp/nvim-ts-autotag" },

  -- telescope
  { "nvim-telescope/telescope-ghq.nvim" },
}
