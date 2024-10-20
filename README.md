# 2nthony's dotfiles

<video src="https://user-images.githubusercontent.com/19513289/219951812-42953edf-2ab2-43d9-91fa-7bb546c3006c.mp4" width="100%"></video>
![cover1](https://cdn.jsdelivr.net/gh/2nthony/statics@main/uPic/Xnip2022-08-11_10-37-20y0XQlQ.jpg)
![cover2](https://cdn.jsdelivr.net/gh/2nthony/statics@main/uPic/Xnip2023-01-18_20-41-19mxUvCj.jpg)

<p align="center">
  <sub>
    <samp>
      <a href="https://github.com/2nthony/vitesse.nvim">vitesse.nvim</a>
    </samp>
  </sub>
</p>

## [💤 LazyVim](https://lazyvim.org) ![](https://img.shields.io/badge/-0.10.x-29BC9B)

Features:

- [x] Refined keymaps for snippet(VS Code like)
- [x] Partially support VS Code workspace settings

### Setup

1. Install [LazyVim](https://www.lazyvim.org/installation)
2. Clone this repo and link `nvim` to `~/.config`

```bash
git clone https://github.com/2nthony/dotfiles.git ~/yourclonedpath
ln -s ~/yourclonedpath/.config/nvim ~/.config
```

### Plugins

All plugins [plugins/](.config/nvim/lua/plugins).

### Keymaps

- [LazyVim keymaps](https://www.lazyvim.org/keymaps)
- [Personal keymaps](.config/nvim/lua/keymaps.lua)
- Press the `<space>` key to check all

#### General

- `<C-h>` better `^`
- `<C-l>` better `$`
- `<C-\>` open a float terminal
- `<s-m-j>` copy line(s) down
- `<s-m-k>` copy line(s) up

## [WezTerm](https://wezfurlong.org/wezterm/)

Link config

```bash
ln -s ~/yourclonedpath/.config/wezterm ~/.config
```

Load config

```bash
echo 'return require("2nthony")' > ~/.wezterm.lua
```

## Zsh

```bash
ln -s ~/yourclonedpath/.zshrc ~
```

- [oh my zsh](https://ohmyz.sh)
- [antigen](https://github.com/zsh-users/antigen) - Plugin manager
  - [zsh-z](https://github.com/agkozak/zsh-z) - Jump directory
  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  - [fzf-zsh-plugin](https://github.com/unixorn/fzf-zsh-plugin#antigen)
- [Maple Font](https://github.com/subframe7536/maple-font)
  - [Nerd fonts](https://github.com/ryanoasis/nerd-fonts)
- [ghq](https://github.com/2nthony/ghq) - GitHub repositories manager
- [eza](https://github.com/eza-community/eza) - `ls` replacement
- [nvm](https://github.com/nvm-sh/nvm) - Node.js version manager
- [Starship](https://starship.rs) - Shell prompt UI

## [Zed](https://github.com/zed-industries/zed)

Settings and Keymaps

```bash
ln -s ~/yourclonedpath/.config/zed/settings.json ~/.config/zed
ln -s ~/yourclonedpath/.config/zed/keymap.json ~/.config/zed
```

## Credit

- [打造 neovim IDE (Chinese)](https://www.bilibili.com/video/BV1WY411P736/?spm_id_from=333.788)
- [craftzdog/dotfiles-public](https://github.com/craftzdog/dotfiles-public)
- [ayamir/nvimdots](https://github.com/ayamir/nvimdots)

## About

> GitHub [2nthony](https://github.com/2nthony) · Twitter [\_2nthony](https://twitter.com/_2nthony)
