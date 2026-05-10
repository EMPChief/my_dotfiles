# Zsh/Oh-My-Zsh Cheat Sheet

## 🐚 Shell Basics

- `reload` Reload zsh configuration
- `c` Clear screen
- `h` Show history
- `Ctrl+r` Search command history (FZF)
- `Ctrl+l` Clear screen
- `!!` Repeat last command
- `!$` Last argument of previous command
- `Ctrl+u` Clear line before cursor
- `Ctrl+k` Clear line after cursor
- `Ctrl+w` Delete word before cursor

---

## 📂 Directory Navigation (Zoxide)

- `z <directory>` Jump to directory (smart cd - replaces cd)
- `z <partial>` Fuzzy match directory name
- `zi` Interactive directory selection with FZF
- `z -` Go to previous directory
- `..` Go up one directory
- `...` Go up two directories
- `....` Go up three directories
- `cdf` Interactive directory search with FZF preview

---

## 📁 File Listing (Eza)

- `ls` List files (icons, git status, compact view)
- `la` List all files including hidden (full details)
- `ll` Long listing with all details and git status
- `lt` Tree view (2 levels)
- `lta` Tree view with hidden files (2 levels)

---

## 🔍 FZF (Fuzzy Finder)

### Keybindings
- `Ctrl+t` Search files in current directory
- `Ctrl+r` Search command history
- `Alt+c` Search and cd into directory

### Functions
- `**<Tab>` Trigger FZF completion (e.g., `vim **<Tab>`)
- `search <term>` Ripgrep search with FZF and bat preview

### FZF Git Shortcuts (if ~/fzf-git.sh/fzf-git.sh exists)
- `Ctrl+g Ctrl+f` Search Git files
- `Ctrl+g Ctrl+b` Search Git branches
- `Ctrl+g Ctrl+t` Search Git tags
- `Ctrl+g Ctrl+h` Search Git commit history
- `Ctrl+g Ctrl+r` Search Git remotes

---

## 📖 File Viewing (Bat)

- `cat <file>` View file with syntax highlighting (aliased to bat)
- `bat <file>` View file with syntax highlighting
- Theme: Tokyo Night (`tokyonight_night`)

---

## 🔧 Git Aliases

- `gs` Git status
- `ga` Git add
- `gc` Git commit
- `gco` Git checkout
- `gcb` Git checkout -b (create new branch)
- `gp` Git push
- `gl` Git log --oneline --graph --decorate
- `gd` Git diff
- `lg` Launch lazygit
- `lzd` Launch lazydocker

---

## 🛠️ Utility Functions & Aliases

- `mkcd <name>` Create directory and cd into it
- `extract <file>` Extract any archive (zip, tar, gz, bz2, rar, 7z, etc.)
- `search <term>` Ripgrep search with FZF preview and line highlighting
- `df` Disk usage (human-readable, aliased)
- `du` Directory size (human-readable, aliased)
- `grep` Ripgrep (aliased)
- `ip` Colorized ip output (aliased)

---

## 🤖 TheFuck

- `fuck` Auto-correct last command
- `fk` Same as fuck (shorter alias)

---

## 🚀 Application Aliases

- `zen` Launch Zen Browser (Flatpak)
- `python` Python 3
- `vim` Neovim
- `vi` Neovim
- `anvim` Launch AstroNvim (isolated config)

---

## 📝 History Commands

- `history` Show full command history
- `history | grep <term>` Search history
- `Ctrl+r` Interactive history search (FZF)
- `↑` / `↓` Navigate history with prefix matching
- `fc` Edit and re-run previous command
- History is shared across all terminal sessions
- 100,000 commands saved

---

## 🔌 Oh-My-Zsh Plugins Active

- `git` Git aliases and prompt integration
- `zsh-autosuggestions` Command suggestions as you type (accept with `→`)
- `zsh-syntax-highlighting` Syntax highlighting for commands
- `colored-man-pages` Colorized man pages
- `command-not-found` Suggests packages when command not found

---

## 🎨 Theme & Tools

- **Theme**: Starship (OMZ theme is disabled — starship handles the prompt)
- **FZF**: Osaka Jade color scheme (custom cyan/jade/teal theme)
- **Bat**: Tokyo Night theme (`tokyonight_night`)
- **Extended Glob**: Enabled for advanced pattern matching
- `auto_cd`: Type a directory name to cd into it without the cd command
- `no_beep`: Terminal bell disabled

---

## 🌐 Environment Variables

- `$EDITOR` = nvim
- `$VISUAL` = nvim
- `$PAGER` = less
- `$LESS` = `-R -F -X --quit-if-one-screen` (colors, auto-quit short output, no clear on exit)
- `$MANPAGER` = bat (man pages rendered with syntax highlighting)
- `$GOPATH` = ~/go
- `$BAT_THEME` = tokyonight_night

---

## 📦 Package Managers & Tools Configured

- **Homebrew** (`brew`) - Linux package manager (active)
- **Zoxide** - Smart directory jumper (replaces cd)
- **TheFuck** - Command correction tool (loaded if installed)
- **FZF** - Fuzzy finder with Osaka Jade theme
- **Bat** - Syntax highlighting cat/man replacement
- **Eza** - Modern ls replacement with icons
- **Ripgrep** (`rg`) - Fast grep replacement (aliased as `grep`)
- **Go** modules - `~/go/bin` in PATH
- **Cargo** (Rust) - `~/.cargo/bin` in PATH
- **npm** global - `~/.npm-global/bin` in PATH
- **Starship** - Active prompt (OMZ theme disabled)
- **fnm** - Fast Node Manager (loaded if installed)
- **mise** - asdf alternative (loaded if installed)
- **direnv** - Environment switcher (loaded if installed)
- PATH deduplication via `typeset -U PATH` (no duplicate entries on reload)

---

## 🔄 Auto-completion

- Press `Tab` for completions
- Press `Tab` twice for menu selection
- Use arrow keys to navigate completion menu
- `**<Tab>` triggers FZF fuzzy completion
- Works with commands, file paths, git branches, etc.
- Case-insensitive matching enabled
- Colorized completion menu

---

## 🎯 Keybindings

### Navigation
- `Ctrl+a` Jump to beginning of line
- `Ctrl+e` Jump to end of line
- `Alt+f` Move forward one word
- `Alt+b` Move backward one word

### Editing
- `Ctrl+u` Clear line before cursor
- `Ctrl+k` Clear line after cursor
- `Ctrl+w` Delete word before cursor
- `Ctrl+d` Delete character or exit shell
- `Alt+d` Delete word forward
- `Alt+Backspace` Delete word backward

### History & Search
- `Ctrl+r` FZF history search
- `↑` History search backward (with prefix matching)
- `↓` History search forward (with prefix matching)

### FZF Shortcuts
- `Ctrl+t` Search files
- `Alt+c` Search and cd to directory

---

## 💡 Pro Tips

- **Accept suggestion**: Press `→` (right arrow) to accept autosuggestion
- **Navigate suggestions**: Use `↑` and `↓` for history with prefix matching
- **Case-insensitive completion**: Type lowercase, matches any case
- **Extended glob patterns**: Use `*`, `**`, `?` for advanced matching (enabled)
- **Hidden commands**: Commands starting with space won't be saved to history
- **Background jobs**: Add `&` at end of command
- **Job control**: `Ctrl+z` to suspend, `fg` to resume
- **FZF previews**: All FZF commands show bat/eza previews for context

---

## 🔧 Config Files

- `~/.zshrc` Main zsh configuration (273 lines)
- `~/.zhistory` Command history file (100,000 commands)
- `~/.oh-my-zsh/` Oh-My-Zsh installation directory
- `~/.config/` Modern config location for various tools
- `~/.zcompdump` Completion cache (refreshed daily for performance)
- `~/.local/bin/` User binaries in PATH

---

## 🆘 Getting Help

- `man <command>` Manual for command (rendered by bat with syntax highlighting)
- `<command> --help` Quick help
- `which <command>` Show command location
- `type <command>` Show command type (alias, function, binary)
- `alias` List all aliases
- `bindkey` List all key bindings

---

## 🔐 Security & Privacy

- Commands starting with space are not saved to history
- History ignores duplicate commands
- Sensitive data not logged or exposed in config

---

## ⚡ Performance Optimizations

- Completion cache refreshed only when older than 24 hours (zsh glob check)
- Fast ESC key response (KEYTIMEOUT=1)
- Shared history across all terminal sessions
- Optional tools (fnm, mise, direnv, thefuck) guarded with `command -v` — no startup errors if missing
- History: expire/ignore all duplicates, verify before execution, ignore space-prefixed commands
- PATH deduplication on every shell start (no bloat on reload)

---

## 🎨 FZF Osaka Jade Theme

Custom color scheme with:
- **Jade/Teal accents** for prompts and pointers
- **Tokyo Night** background colors
- **Purple** headers
- **Cyan** info text
- **Green** markers
- Rounded borders with 60% screen height
- Custom symbols: `  ` (prompt), `▶` (pointer), `✓` (marker)

---

## 🔐 Security & Privacy (continued)

- `hist_ignore_all_dups`: No duplicate commands kept anywhere in history (stronger than `hist_ignore_dups`)
