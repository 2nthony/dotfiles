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

return packer.startup(function()
  -- core
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- basic
  use 'tpope/vim-surround'
  use 'hoob3rt/lualine.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'romgrk/barbar.nvim'
  use 'mbbill/undotree'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-spectre' -- global character search
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua' -- file explorer

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use {
    'williamboman/mason-lspconfig.nvim', -- formerly lsp installer
    requires = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig'
    }
  }
  use 'hrsh7th/nvim-cmp'
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    requires = {
      "hrsh7th/nvim-cmp",
    }
  }
  use 'onsails/lspkind-nvim'
  use 'glepnir/lspsaga.nvim'
  use 'folke/lsp-colors.nvim'
  use 'L3MON4D3/LuaSnip'
  use {
    'saadparwaiz1/cmp_luasnip',
    requires = {'L3MON4D3/LuaSnip'}
  }
  use {
    'rafamadriz/friendly-snippets',
    requires = {'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip'}
  }
  use 'folke/trouble.nvim'
  use 'simrat39/rust-tools.nvim'
  use {
    "zbirenbaum/copilot-cmp",
    module = "copilot_cmp",
    requires = {
      "github/copilot.vim",
      "zbirenbaum/copilot.lua",
      'tjdevries/colorbuddy.nvim',
    },
    disable = true,
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use {
    'tom-anders/telescope-vim-bookmarks.nvim',
    requires = {
      'MattesGroeger/vim-bookmarks'
    }
  }

  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'windwp/nvim-ts-autotag'
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = {
      'tpope/vim-commentary'
    }
  }
  use {
    'folke/todo-comments.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {
    'sindrets/diffview.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- theme
  use 'folke/tokyonight.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = {
      'tjdevries/colorbuddy.nvim'
    }
  }

  -- highlight
  use 'norcalli/nvim-colorizer.lua' -- highlight HEX color

  -- others
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }
  use 'sbdchd/neoformat' -- format file on save
  use {'akinsho/toggleterm.nvim', tag = 'v2.1.0'}
  use 'phaazon/hop.nvim' -- goto a word or line
  use 'rmagatti/auto-session' -- restore session
  use {
    'rhysd/accelerated-jk',
    commit = '156c5158b72059404f6b8aaf15b59f87dd0aaa88'
  }
  use 'wakatime/vim-wakatime'
end)
