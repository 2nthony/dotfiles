# 2nthony's dotfiles

<video src="https://user-images.githubusercontent.com/19513289/219951812-42953edf-2ab2-43d9-91fa-7bb546c3006c.mp4" width="100%"></video>
![cover1](https://cdn.jsdelivr.net/gh/2nthony/statics@main/uPic/Xnip2022-08-11_10-37-20y0XQlQ.jpg)
![](https://cdn.jsdelivr.net/gh/2nthony/statics@main/uPic/Xnip2023-01-18_20-41-19mxUvCj.jpg)

<p align="center">
  <sub>
    <samp>
      <a href="https://github.com/2nthony/vitesse.iterm">vitesse.iterm</a> •
      <a href="https://github.com/2nthony/vitesse.nvim">vitesse.nvim</a>
    </samp>
  </sub>
</p>

## [💤 LazyVim](https://lazyvim.org) ![](https://img.shields.io/badge/-0.8.x-29BC9B)

lazy with extra features:

- [x] AI-Powered Autocomplete([Codeium](https://codeium.com))
- [x] Good Looking Theme([vitesse](https://github.com/2nthony/vitesse))
- [x] Transparent friendly
- [x] Git Integration(LazyGit)
- [x] ...

### Setup

1. Install [LazyVim](https://www.lazyvim.org/installation)
2. Clone this repo and link `nvim` to `~/.config`

```bash
git clone https://github.com/2nthony/dotfiles.git ~/yourpath
ln -s ~/yourpath/.config/nvim ~/.config
```

### Plugins

All plugins [plugins/](.config/nvim/lua/plugins).

### Keybindings

The latest keybindings in [keymaps.lua](.config/nvim/lua/config/keymaps.lua).

#### `<C>` means to `<Ctrl>`

- `<C-h>` better `^`
- `<C-l>` better `$`
- `<C-a>` select all text
- `<C-j>` LSP diagnostic next, `<S-C-j>` LSP diagnostic prev
- `<C-k>` LSP hover
- `<C-\>` open a float terminal
- `<C-n>` new tab `:tabedit`

#### `<Tab>`

- `<Tab>` next buffer, `<S-Tab>` previous buffer

#### `f` means to `find` or `file`

- `fe` file explorer
- `fd` locate current file in file explorer
- `ff` find files
- `fr` find text in files(live grep) (install `ripgrep`)
- `fb` find a buffer(tab)
- `fo` find oldfiles
- `fc` find changed files (git status)
- `ftw` find trouble workspace(LSP diagnostics)
- `ftc` find todo comments

#### `g` means to `go` or `git`

- `git` open lazygit (install `lazygit`)
- `gw` go to word after cursor, `gW` before cursor([leap.nvim](https://github.com/ggandor/leap.nvim))
- `gsj` git next hunk
- `gsk` git previous hunk
- `gss` gitsigns stage hunk
- `gsS` gitsigns stage file
- `gsr` gitsigns reset hunk
- `gsu` gitsigns undo stage hunk
- `gsp` gitsigns preview hunk
- `gdo` git diffview open
- `gdc` git diffview close
- `gdh` git diffview file history
- `gdr` git diffview refresh

#### `s` means to `switch`, `split`, `see`, `search` or `LSP`

- `ss` split window
- `sv` vertical split window
- `sh` switch to left window
- `sj` switch to below window
- `sk` switch to above window
- `sl` switch to right window
- `sf` LSP finder
- `sp` LSP see preview definition
- `sr` LSP replace declaration
- `sdc` LSP diagnostic, cursor
- `sdl` LSP diagnostic, line
- `sdb` LSP diagnostic, buffer
- `sdw` LSP diagnostic, workspace
- `sca` LSP code action
- `sci` LSP incoming calls
- `sco` LSP outgoing calls

#### Others, `<Space>` instead of `\`

- `<Space>bd` delete buffer
- `<Space>bD` force(!) delete buffer
- `<Space>bp` pin a buffer

### Code Snippets ([luasnip](https://github.com/L3MON4D3/LuaSnip))

I use [Dropcode](https://github.com/egoist/dropcode) to manage my code snippets.

```json
// ~/Library/Application Support/Code/User/snippets/package.json
{
  "name": "my-snippets",
  "contributes": {
    "snippets": [
      {
        "language": [
          "all"
        ],
        "path": "./dropcode.code-snippets"
      }
    ]
  }
}
```

## Shell

- [Fish shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher) - Plugin manager
- [Tide](https://github.com/IlanCosman/tide) - Shell theme
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts. I use Hack.
- [z for fish](https://github.com/jethrokuan/z) - Directory jumping
- [Exa](https://the.exa.website/) - `ls` replacement
- [ghq](https://github.com/2nthony/ghq) - GitHub repositories manager
- [peco](https://github.com/peco/peco) - Interactive filtering
- [nvm](https://github.com/nvm-sh/nvm) - Node.js version manager
  - [nvm.fish](https://github.com/jorgebucaran/nvm.fish) - Fish nvm
- [zellij](https://github.com/zellij-org/zellij) - Workspace management, tmux alternative
- [vitesse.iterm](https://github.com/2nthony/vitesse.iterm) - Vitesse theme for iTerm2

## Troubleshootings

<!-- ### `<C-S-*>` key not working -->
<!-- iTerm2: `Preferences` -> `Profiles` -> `Keys` -> `Left Option Key: Meta/Esc+` -->

<!-- Details from: https://github.com/zellij-org/zellij/issues/265#issuecomment-823703039 -->

## Credit

- [打造 neovim IDE (Chinese)](https://www.bilibili.com/video/BV1WY411P736/?spm_id_from=333.788)
- [craftzdog/dotfiles-public](https://github.com/craftzdog/dotfiles-public)
- [ayamir/nvimdots](https://github.com/ayamir/nvimdots)

## About

> GitHub [2nthony](https://github.com/2nthony) · Twitter [\_2nthony](https://twitter.com/_2nthony)
