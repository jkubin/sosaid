# sosaid (sosreport aid)
This is a patch for a `netrw` plugin in Vim, which allows you to quickly explore many files with very little effort.  
The resulting modified plugin is especially suitable for quick exploration of [sosreports](https://access.redhat.com/solutions/3592).

## What the patch offers?
- Quickly browses many files with an instant file preview
- Better focus on the problem that the customer reported
- Better chance of finding something other than just a reported problem
- Small set of basic shortcuts (`j`, `k`, `Ctrl-j`, `Ctrl-k`) to control
- The behavior of the plugin can be configured by the user [^1]
- The plugin can quickly browse any files on the system
- Smooth integration into the original `netrw` plugin

[^1]: modify the patch for a different behaviour or a different default configuration

## How to install or uninstall the modified netrw plugin?
```
# dnf install -y vim
$ mkdir -p ~/.vim/autoload
$ cd ~/.vim/autoload
$ cp /usr/share/vim/vim??/autoload/netrw.vim .
$ sed -n '/^" Version:\t/s///p' netrw.vim
170
$ patch < sosaid_netrw_170.patch
$ rm ~/.vim/autoload/netrw.vim		<--- uninstall
```
Is there not an exact version in the repository?
Try to apply the closest patch.

## How to use the plugin?
```
$ vim sosreport-12345678/

or just

$ vim .
```

## How to control the plugin?
![Basic keyboard shortcuts](sosaid_ctl.svg)

## Description of the control shortcuts
| Shortcut | Functionality |
| -------- | ------------- |
| `j` | ↓ go down and preview the next file or the directory listing |
| `Ctrl-j` | ↓ go down to the directory if there is a directory on the active line |
| `Ctrl-j` | if there is a file on the active line, opens it in a new tab for further examination |
| `k` | ↑ go up and preview the previous file or the directory listing |
| `Ctrl-k` | ↑ go up one level from the current directory |

## Auxiliary shortcuts from the plugin
| Shortcut | Functionality |
| -------- | ------------- |
| `p` | display the item in the preview window (the first or the only item in the directory) |
| `Enter` | same as `Ctrl-j` |
| `Ctrl-l` | turn off the **highlighted** search string instead of typing `:noh` |
| `\ r` | list Vim [registers](#how-to-copy-a-register-to-the-command-line) |
| `\ w` | show/hide white characters |
| `\ W` | wrap/unwrap long lines |

## How to process an examined file (command-line mode)
| Command | Functionality |
| -------- | ------------- |
| `:g/boring/d` | delete boring lines (mnemonic: **g**rep)|
| `:g!/interesting/d` | delete non-interesting lines |
| `:v/interesting/d` | delete non-interesting lines (mnemonic: grep -**v**) |
| `:w result.txt` | write the processed data to the `result.txt` file |
| `:tabonly` | Too many tabs opened? Close all but the current one. |

## How to copy a string to the command line
- `^r^w` means press `Ctrl-r` `Ctrl-w` to copy a `word` under the cursor to the command line
- `^r^a` means press `Ctrl-r` `Ctrl-a` to copy a `w:o-r.d` under the cursor to the command line
- `^r^/` means press `Ctrl-r` `Ctrl-/` to copy the **\\<highlighted string\\>** (pressed `*` or `#`) to the command line
- `^r^/` means press `Ctrl-r` `Ctrl-/` to copy the **highlighted string** (pressed `g *` or `g #`) to the command line

| Command | Functionality |
| -------- | ------------- |
| `:v/^r^w/d` | copy the `word` from examined file to the command line |
| `:v/^r^a/d` | copy the `w:o-r.d` from examined file to the command line |
| `:g/^r^//d` | copy the highlighted search string to the command line |
| `Ctrl-c` | cancel the command line and put the cursor to another `word` |

## How to copy a register to the command line
- `^r^"` means press `Ctrl-r` `"` to copy the [unnamed register](#vim-help-shortcuts-registers-quickref) to the command line

| Shortcut | Functionality |
| -------- | ------------- |
| `:g/^r"/d` | copy the unnamed register to the command line |

## Built-in shortcuts (normal mode)
| Shortcut | Functionality |
| -------- | ------------- |
| `H` | move to **H**igh or **H**ome of the window |
| `M` | move to **M**iddle line of the window |
| `L` | move to **L**ow or **L**ast line of the window  |
| `Ctrl-d` | scroll down half a screen |
| `Ctrl-u` | scroll up half a screen |
| `Ctrl-f` | scroll down a screen |
| `Ctrl-b` | scroll up a screen |
| `/filename` | search forward for a filename |
| `?filename` | search backward for a filename |
| `n` | search forward for a next filename |
| `N` | search backward for a previous filename |
| `gt` | move to the next tab |
| `Ctrl-PageDown` | move to the next tab (does not work in the `screen` program) |
| `gT` | move to the previous tab |
| `Ctrl-PageUp` | move to the previous tab (does not work in the `screen` program) |
| `Ctrl-w H` | move the active window to the right (vertical split window) |
| `Ctrl-w L` | move the active window to the left (vertical split window) |
| `Ctrl-w Ctrl-w` | move the cursor to the adjacent split window |
| `Ctrl-c` | cancels the listing of files in the directory (too many files) |
| `Ctrl-g` | print the full file name to the status bar |

## Vim help, shortcuts, registers, quickref
```
:tab h
:tab h index
:tab h registers
:tab h quickref
```

## How to learn Vim
```
$ vimtutor
```

- I am helpless, [how do I exit Vim](https://github.com/hakluke/how-to-exit-vim/blob/master/README.md)?

---

## How to create a patch with a bugfix or a new feature
```
$ sed -n '/^" Version:\t/s///p' /usr/share/vim/vim??/autoload/netrw.vim
165
$ diff -u /usr/share/vim/vim??/autoload/netrw.vim ~/.vim/autoload/netrw.vim > sosaid_netrw_165.patch
```

---
