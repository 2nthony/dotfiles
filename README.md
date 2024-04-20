# 2nthony's dotfiles

<video src="https://user-images.githubusercontent.com/19513289/219951812-42953edf-2ab2-43d9-91fa-7bb546c3006c.mp4" width="100%"></video>
![cover1](https://cdn.jsdelivr.net/gh/2nthony/statics@main/uPic/Xnip2022-08-11_10-37-20y0XQlQ.jpg)
![](https://cdn.jsdelivr.net/gh/2nthony/statics@main/uPic/Xnip2023-01-18_20-41-19mxUvCj.jpg)

<p align="center">
  <sub>
    <samp>
      <a href="https://github.com/2nthony/vitesse.nvim">vitesse.nvim</a>
    </samp>
  </sub>
</p>

## [💤 LazyVim](https://lazyvim.org) ![](https://img.shields.io/badge/-0.9.x-29BC9B)

lazy with extra features:

- [x] Supertab(VS Code like)
- [x] AI-Powered Autocomplete(Copilot, with hints, not cmp)
- [x] Good Looking Theme([vitesse](https://github.com/2nthony/vitesse.nvim))
- [x] Transparent friendly
- [x] Git Integration(LazyGit, Neogit)
- [x] Vue supported([vue.lua](.config/nvim/lua/plugins/extras/lang/vue.lua))
- [x] Partially support vscode workspace settings
- [x] ...

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
- `<C-a>` select all text
- `<C-\>` open a float terminal
- `<s-a-j>` copy line(s) down
- `<s-a-k>` copy line(s) up

#### LSP

- `K` LSP hover
- `<C-j>` LSP diagnostic next, `J` LSP diagnostic prev
- `<C-k>` LSP signature help

## [WezTerm](https://wezfurlong.org/wezterm/)

Link config

```bash
ln -s ~/yourclonedpath/.config/wezterm ~/.config
```

Load config

```bash
echo 'return require("config")' > ~/.wezterm.lua
```

## Shell

- [Fish shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher) - Plugin manager
  - [Tide](https://github.com/IlanCosman/tide) - Shell theme
  - [z for fish](https://github.com/jethrokuan/z) - Directory jumping
  - [fzf for fish](https://github.com/PatrickF1/fzf.fish) - requires `fzf`
- [Maple Font](https://github.com/subframe7536/maple-font)
  - [Nerd fonts](https://github.com/ryanoasis/nerd-fonts)
- [ghq](https://github.com/2nthony/ghq) - GitHub repositories manager
- [eza](https://github.com/eza-community/eza) - `ls` replacement
- [nvm](https://github.com/nvm-sh/nvm) - Node.js version manager
  - [nvm.fish](https://github.com/jorgebucaran/nvm.fish) - Fish nvm

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
