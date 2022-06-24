![cover](https://cdn.jsdelivr.net/gh/2nthony/statics@main/uPic/SGZo9qiZPAEV.png)

# 2nthony's dotfiles

## Shell

- [Fish shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher) - Plugin manager
- [Tide](https://github.com/IlanCosman/tide) - Shell theme
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts. I use Hack.
- [z for fish](https://github.com/jethrokuan/z) - Directory jumping
- [Exa](https://the.exa.website/) - `ls` replacement
- [ghq](https://github.com/x-motemen/ghq) - Local Git repository organizer
- [peco](https://github.com/peco/peco) - Interactive filtering
- [fnm](https://github.com/Schniz/fnm) - NVM alternative
- [zellij](https://github.com/zellij-org/zellij) - Workspace management, tmux alternative

### peco

Modify the file `.config/fish/user-config.fish`:

```fish
# which means `$HOME/dev` for peco to list git repos
export WORKSPACE="dev"
```

## Vim

![](https://badgen.net/badge/NeoVIM/0.7.0/cyan)

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
- [x] Tabbar
- [x] Statusline
- [x] Good Looking Theme
- [x] ...

### Plugins

Full plugins see [plugins.lua](.config/nvim/lua/plugins.lua).

### Keybindings

The latest keybindings in [keymaps.lua](.config/nvim/after/plugin/user/keymaps.lua).

#### `f` means to `find` or `file`

- `fe` toggle file explorer
- `fd` locate current file in file explorer
- `ff` find a file
- `fr` find character(live grep) in files (install `ripgrep`)
- `fb` find a buffer(tab)
- `fo` find oldfiles

#### `g` means to `go` or `git`

- `git` open lazygit (install `lazygit`)
- `gw` go to word
- `gl` go to line
- `gj` git next hunk
- `gk` git previous hunk
- `ghs` git stage hunk
- `ghr` git reset hunk
- `ghu` git undo stage hunk
- `ghp` git preview hunk
- `ghS` git stage current file

See the full keybindings for git in [keymaps.gitsigns](.config/nvim/after/plugin/user/keymaps.lua)

#### `s` means to `switch`, `split` or others

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

## Credit

You can watch the **origin** [video(Bilibili for Chinese)](https://www.bilibili.com/video/BV1WY411P736/?spm_id_from=333.788) for the fully tutorial.

## About

> GitHub [2nthony](https://github.com/2nthony) · Twitter [\_2nthony](https://twitter.com/_2nthony)
