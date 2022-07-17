-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

local status_packer_ok, packer = pcall(require, "packer")
if not status_packer_ok then
  return
end

return require('packer').startup(function()
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use 'wakatime/vim-wakatime'

  use {
    'rhysd/accelerated-jk',
    commit = '156c5158b72059404f6b8aaf15b59f87dd0aaa88'
  }
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'lewis6991/impatient.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nathom/filetype.nvim'
  use 'romgrk/barbar.nvim'
  use 'mbbill/undotree'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  -- use 'onsails/lspkind-nvim'
  -- use 'tami5/lspsaga.nvim'
  use 'folke/lsp-colors.nvim'
  use 'RRethy/vim-illuminate'
  use 'L3MON4D3/LuaSnip'
  use {
    'saadparwaiz1/cmp_luasnip',
    requires = {'L3MON4D3/LuaSnip'}
  }
  use {
    'rafamadriz/friendly-snippets',
    requires = {'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip'}
  }
  use 'stevearc/aerial.nvim'
  use 'folke/trouble.nvim'
  use 'rmagatti/goto-preview'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use 'nvim-telescope/telescope-media-files.nvim'
  use {
    'tom-anders/telescope-vim-bookmarks.nvim',
    requires = {
      'MattesGroeger/vim-bookmarks'
    }
  }

  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'windwp/nvim-ts-autotag'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    'folke/todo-comments.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use 'p00f/nvim-ts-rainbow'

  -- git
  use {'lewis6991/gitsigns.nvim', tag = 'v0.4'}
  use 'sindrets/diffview.nvim'

  -- theme
  use {'catppuccin/nvim', as = 'catppuccin'}
  use 'folke/tokyonight.nvim'
  use 'stevearc/dressing.nvim' -- popup beautify

  -- others
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    tag = 'v0.0.10'
  }
  use 'sbdchd/neoformat'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-spectre'
  use 'norcalli/nvim-colorizer.lua'
  use {'folke/which-key.nvim', disable = true}
  use {'akinsho/toggleterm.nvim', tag = 'v1.0.0'}
  use 'simrat39/rust-tools.nvim'
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    requires = {'zbirenbaum/copilot.lua', 'github/copilot.vim'}
  }
  use 'phaazon/hop.nvim'
  -- use 'mhartington/formatter.nvim'
  use 'rmagatti/auto-session'
end)
