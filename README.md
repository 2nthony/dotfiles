![cover](https://cdn.jsdelivr.net/gh/2nthony/statics@main/uPic/hIGv561ETqRTHWgdbH.png)

# 2nthony's dotfiles

## Shell

- [Fish shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher) - Plugin manager
- [Tide](https://github.com/IlanCosman/tide) - Shell theme
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts. I use Hack.
- [z for fish](https://github.com/jethrokuan/z) - Directory jumping
- [Exa](https://the.exa.website/) - `ls` replacement
- [ghq](https://github.com/2nthony/ghq) - GitHub repositories manager
- [peco](https://github.com/peco/peco) - Interactive filtering
- [nvm](https://github.com/nvm-sh/nvm) - Node.js manager
  - [nvm.fish](https://github.com/jorgebucaran/nvm.fish) - Fish nvm
- [zellij](https://github.com/zellij-org/zellij) - Workspace management, tmux alternative

## Fish

**NOT tested to a fresh device.**

Clone this repo and link `fish` to `~/.config`

```bash
git clone https://github.com/2nthony/dotfiles.git ~/yourpath
ln -s ~/yourpath/.config/fish ~/.config
```

## NeoVim

![](https://img.shields.io/badge/-0.7.0-29BC9B)

### Installation

Clone this repo and link `nvim` to `~/.config`

```bash
git clone https://github.com/2nthony/dotfiles.git ~/yourpath
ln -s ~/yourpath/.config/nvim ~/.config
```

### Features

- [x] LSP
- [x] Git Integration
- [x] Code Syntax Highlighting
- [x] Code Snippets
- [x] Code Completion
- [x] Code Diagnostics
- [x] GitHub Copilot
- [x] Bufferline
- [x] Statusline
- [x] Good Looking Theme
- [x] Auto Session
- [x] ...

### Plugins

Full plugins see [plugins.lua](.config/nvim/lua/plugins.lua).

### Keybindings

The latest keybindings in [keymaps.lua](.config/nvim/after/plugin/user/keymaps.lua).

#### `C/Ctrl`

- `C-h` better `^`
- `C-l` better `$`
- `C-a` select all text
- `C-j` LSP diagnostic next, `S-C-j` LSP diagnostic prev
- `C-k` LSP hover
- `C-\` open a float terminal

#### `f` means to `find` or `file`

- `fe` toggle file explorer
- `fd` locate current file in file explorer
- `ff` find a file
- `fr` find character(live grep) in files (install `ripgrep`)
- `fb` find a buffer(tab)
- `fo` find oldfiles
- `ft` find todo comments
- `fm` find bookmarks, `fM` find project bookmarks
  - `mm` toggle bookmark

#### `g` means to `go` or `git`

- `git` open lazygit (install `lazygit`)
- `gw` go to word
- `gl` go to line
- `gj` git next hunk
- `gk` git previous hunk
- `ghs` git stage hunk
- `ghS` git stage file
- `ghr` git reset hunk
- `ghu` git undo stage hunk
- `ghp` git preview hunk

See the full keybindings for git in [keymaps.gitsigns](.config/nvim/after/plugin/user/keymaps.lua)

#### `s` means to `switch`, `split`

- `ss` split window
- `sv` vertical split window
- `sh` focus left window
- `sj` focus below window
- `sk` focus above window
- `sl` focus right window

#### `;` instead of `\`

- `;w` = `:w`
- `;q` = `:q`, `:Q` = `:q!`
- `;<s-tab>` previous buffer
- `;<tab>` next buffer
- `;1`, `;2`, ... go to buffer, `;0` go to the last buffer
- `;x` close buffer
- `;X` force(!) close buffer
- `;bp` pick a buffer
- `;S` ripgrep search(like global search)
- `;tt` toggle show troubles(problems)

## Credit

You can watch the **origin** [video(Bilibili for Chinese)](https://www.bilibili.com/video/BV1WY411P736/?spm_id_from=333.788) for the fully tutorial.

## About

> GitHub [2nthony](https://github.com/2nthony) ?? Twitter [\_2nthony](https://twitter.com/_2nthony)
