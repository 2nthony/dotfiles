![cover](https://cdn.jsdelivr.net/gh/2nthony/statics@main/uPic/YThN7QEsDMLt.png)

## 2nthony's dotfiles

**Warning**: Use it with your own risk!

This is a **MODIFIED** version from https://github.com/craftzdog/dotfiles-public .

## Contents

- NeoVIM config
  - Plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug)
- tmux config
- git config
- fish config

## Vim setup

Requires Neovim (>= 0.5)

- [vim-plug](https://github.com/junegunn/vim-plug) - A minimalist Vim plugin manager
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's built-in LSP
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - [Treesitter](https://github.com/tree-sitter/tree-sitter) configurations and abstraction layer for Neovim
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion plugin for neovim coded in Lua
- [tami5/lspsaga.nvim](https://github.com/tami5/lspsaga.nvim) - A light-weight LSP plugin based on Neovim built-in LSP with highly a performant UI
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder over lists
  - Install [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) dependency: `brew install ripgrep`

More to see [plug.vim](.config/nvim/plug.vim).

## Shell setup

- [Fish shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher) - Plugin manager
- [Tide](https://github.com/IlanCosman/tide) - Shell theme
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts. I use Hack.
- [z for fish](https://github.com/jethrokuan/z) - Directory jumping
- [Exa](https://the.exa.website/) - `ls` replacement
- [ghq](https://github.com/x-motemen/ghq) - Local Git repository organizer
- [peco](https://github.com/peco/peco) - Interactive filtering
- [fnm](https://github.com/Schniz/fnm) - NVM alternative

## LSP setup

Requires nvim-lspconfig

- TypeScript(tsserver)
- Vue(Volar)
- Svelte
- Rust
- Go
- Tailwindcss

## How to use

Please follow https://github.com/craftzdog/dotfiles-public#how-to-use

## Differents

### vim-plug

- `completion-nvim` -> `hrsh7th/nvim-cmp`
- `glepnir/lspsaga.nvim` -> `tami5/lspsaga.nvim`

### tmux

- Use `C-b` as prefix key

### peco

Modify the file `.config/fish/user-config.fish`:

```fish
# which means `$HOME/dev` for peco to list git repos
export WORKSPACE="dev"
```

## About

> GitHub([2nthony](https://github.com/2nthony)) · Twitter([2nthony](https://twitter.com/2nthony))
