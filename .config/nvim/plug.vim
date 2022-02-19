if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'onsails/lspkind-nvim'
  Plug 'tami5/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }
  Plug 'sbdchd/neoformat'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-spectre'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'tanvirtin/vgit.nvim'
  Plug 'tpope/vim-commentary'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'folke/todo-comments.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'weilbith/nvim-code-action-menu'
  Plug 'TimUntersberger/neogit'
  Plug 'sindrets/diffview.nvim'
  Plug 'gelguy/wilder.nvim', { 'do': ':let &rtp=&rtp && :UpdateRemotePlugins' }
endif

Plug 'wakatime/vim-wakatime'

Plug 'rhysd/accelerated-jk'

call plug#end()
