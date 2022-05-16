if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'rhysd/accelerated-jk'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'github/copilot.vim'

if has("nvim")
  Plug 'lewis6991/impatient.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  " Plug 'onsails/lspkind-nvim'
  " Plug 'tami5/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'RRethy/vim-illuminate'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets' " for LuaSnip
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'stevearc/aerial.nvim'
  Plug 'folke/trouble.nvim'

  " telescope
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-ui-select.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope-media-files.nvim'

  " treesitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'windwp/nvim-ts-autotag'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'folke/todo-comments.nvim'
  Plug 'p00f/nvim-ts-rainbow'

  " git
  Plug 'lewis6991/gitsigns.nvim', { 'tag': 'v0.4' }
  Plug 'sindrets/diffview.nvim'

  " theme
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install', 'for': ['md', 'markdown'], 'tag': 'v0.0.10' }
  Plug 'sbdchd/neoformat'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-spectre'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'folke/which-key.nvim'
  Plug 'akinsho/toggleterm.nvim', { 'tag': 'v1.0.0' }
  " Plug 'simrat39/rust-tools.nvim'
  " Plug 'zbirenbaum/copilot.lua'
  " Plug 'zbirenbaum/copilot-cmp'
endif

Plug 'wakatime/vim-wakatime'

call plug#end()
