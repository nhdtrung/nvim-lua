# Neovim from scratch

## Try out this config

Make sure to remove or move your current `nvim` directory

**IMPORTANT** Requires [Neovim v0.8.0](https://github.com/neovim/neovim/releases/tag/v0.8.0) or [Nightly](https://github.com/neovim/neovim/releases/tag/nightly). 
```
git clone https://github.com/nhdtrung/nvim-lua.git ~/.config/nvim
```

### Nerd Font to use vim-devicons plugin.
Download a [Nerd Font](http://nerdfonts.com/)
Unzip and copy to `~/.fonts`
Run the command `fc-cache -fv` to manually rebuild the font cache
Add:  `font_family  <font-name>` and  `bold_font <font-name>` into ~/.config/kitty/kitty.conf to apply .

Run `nvim` and wait for the plugins to be installed 

MacOSX
```
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 

### Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup. So let's fix that

### First we'll fix copy/paste
Install xclip for copy to system clipboard
```
sudo apt install xclip #Ubuntu
```
OR
- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```
---
## 3. Shortcuts
### TComment
| KEY | ACTION |
| ------ | ------ |
| `gc` | comment out line in visual mode |
| `gcc` | comment out line in normal mode |

### vim-tmux-navigator

Move between nvim split windows.
| KEY | ACTION |
| ------ | ------ |
| `ctrl-h` | Left |
| `ctrl-j` | Down |
| `ctrl-k` | Up |
| `ctrl-l` | Right |


### Fzf

| KEY | ACTION |
| ------ | ------ |
| `,t` | Git Files |
| `,b` | Bufers |
| `,r` | Files |
|`Ag pattern`| Search by Ag - required Ag installed  |
|`Rg pattern`| Search by Rg - required Rg installed  |


### easyMotion

| KEY | ACTION |
| ------ | ------ |
| `,,w` | Find next |
| `,,b` | Find prev |

### Coc-Explorer 

| KEY | ACTION |
| ------ | ------ |
    "e": "open",
    "s": "open:split",
    "E": "open:vsplit",
    "t": "open:tab",
    "<bs>": ["wait", "gotoParent"],
    "gs": ["wait", "reveal:select"],
    "il": "preview:labeling",
    "ic": "preview:content",
    "Il": "previewOnHover:toggle:labeling",
    "Ic": "previewOnHover:toggle:content",
    "II": "previewOnHover:disable",

    "yp": "copyFilepath",
    "yn": "copyFilename",
    "yy": "copyFile",
    "dd": "cutFile",
    "p": "pasteFile",
    "df": "delete",
    "dF": "deleteForever",

    "a": "addFile",
    "A": "addDirectory",
    "r": "rename",

    "zh": "toggleHidden",
    "g<dot>": "toggleHidden",
    "R": "refresh",

    "?": "help",
    "q": "quit",
    "<esc>": "esc",
    "X": "systemExecute",
    "gd": "listDrive",

    "f": "search",
    "F": "searchRecursive",

    "gf": "gotoSource:file",
    "gb": "gotoSource:buffer",

### Keyboard Shortcuts ### 

AG search:
| KEY | ACTION |
| ------ | ------ |
| `e` | open file and close the quickfix window |
| `o` | open (same as enter) |
| `go` | preview file (open but maintain focus on ag.vim results) |
| `t` | open in new tab |
| `T` | open in new tab silently |
| `h` | open in horizontal split |
| `H` | open in horizontal split silently |
| `v` | open in vertical split |
| `gv` | open in vertical split silently |
| `q` | close the quickfix window |

### T-comment

| KEY | ACTION |
| ------ | ------ |
| `gc` | comment out line in visual mode |
| `gcc` | comment out line in normal mode |
| `gcip` | comment out block |

### T-muxnavigation

| KEY | ACTION |
| ------ | ------ |
| `ctrl-h` | Left |
| `ctrl-j` | Down |
| `ctrl-k` | Up |
| `ctrl-l` | Right |
| `ctrl-\` | Previous split |

### Folds: Currently is using **manual** mode

| KEY | ACTION |
| ------ | ------ |
| `z-f` | Create |
| `z-c` | Close |
| `z-o` | Open |
| `z-d` | Delete |

### Tagbar

| KEY | ACTION |
| ------ | ------ |
| `F12` | Show the tagbar |

### Coc-yank 

| KEY | ACTION |
| ------ | ------ |
| `P` | Paste from buffers |

### Useful keys

| KEY | ACTION |
| ------ | ------ |
| `,.` | Go to last edit location |
| `,z` | Move previous  buffers |
| `,x` | Move next buffers |
| `,w` | Trailing whitespace |
| `H`, `M`, `L` | Move to top/middle/bottom screen |
| `zz`, `zt`, `zb` | Current line to top/middle/bottom screne |
| `Ctrl - u` / `Ctrl - d` | Scroll half page up/down |
| `Ctrl - b` / `Ctrl - f` | Scroll full page up/down |
| `Ctrl - o` | Old cursor position - this is a standard mapping but very useful, so included here |
| `Ctril - i` | opposite of Ctrl-O (again, this is standard) |
| File Navigation | |
| `//` | clear the search |
| `,t` | CtrlP fuzzy file selector |
| `,b` | CtrlP buffer selector - great for jumping to a file you already have open |
| `Ctrl-\` | Show current file in coc-explorer|
|`,#` `,"` `,'` `,]` `,)` `,}` | to surround a word in these common wrappers. the # does #{ruby interpolation}. works in visual mode (thanks @cj). Normally these are done with something like ysw#|
| `%` | jump between matching parenthesis, braces, brackets, quotes, etc. |
| `shilf + *` | higlt light current word => coc-config |
| `space + o` | search method in currents file |
| `y + i + char` | copy text inside surrounded|


