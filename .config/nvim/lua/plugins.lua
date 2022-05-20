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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_packer_ok, packer = pcall(require, "packer")
if not status_packer_ok then
  return
end

return require('packer').startup(function()
  use "wbthomason/packer.nvim" -- Have packer manage itself

  use 'rhysd/accelerated-jk'
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
  use {'github/copilot.vim', disable = true}

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
  use 'ray-x/lsp_signature.nvim'
  use 'stevearc/aerial.nvim'
  use 'folke/trouble.nvim'
  use 'rmagatti/goto-preview'

  -- telescope
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'stevearc/dressing.nvim' -- ui select enhancement

  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'windwp/nvim-ts-autotag'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'folke/todo-comments.nvim'
  use 'p00f/nvim-ts-rainbow'

  -- git
  use {'lewis6991/gitsigns.nvim', tag = 'v0.4'}
  use 'sindrets/diffview.nvim'

  -- theme
  use {'catppuccin/nvim', as = 'catppuccin'}

  -- others
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = {'md', 'markdown'},
    tag = 'v0.0.10'
  }
  use 'sbdchd/neoformat'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-spectre'
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/which-key.nvim'
  use {'akinsho/toggleterm.nvim', tag = 'v1.0.0'}
  -- use 'simrat39/rust-tools.nvim'
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    requires = {'zbirenbaum/copilot.lua'}
  }
  use 'phaazon/hop.nvim'
end)
