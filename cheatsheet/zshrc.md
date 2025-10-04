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

## 🛠️ Utility Functions

- `mkcd <name>` Create directory and cd into it
- `extract <file>` Extract any archive (zip, tar, gz, bz2, rar, 7z, etc.)
- `search <term>` Ripgrep search with FZF preview and line highlighting

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

- **Theme**: Agnoster (shows git status, path)
- **FZF**: Osaka Jade color scheme (custom cyan/jade/teal theme)
- **Bat**: Tokyo Night theme (`tokyonight_night`)
- **Prompt**: Shows username@hostname, current directory, git branch
- **Extended Glob**: Enabled for advanced pattern matching

---

## 🌐 Environment Variables

- `$EDITOR` = nvim
- `$VISUAL` = nvim
- `$PAGER` = less
- `$GOPATH` = ~/go
- `$BAT_THEME` = tokyonight_night

---

## 📦 Package Managers & Tools Configured

- **Homebrew** (`brew`) - Linux package manager (active)
- **Zoxide** - Smart directory jumper (replaces cd)
- **TheFuck** - Command correction tool
- **FZF** - Fuzzy finder with Osaka Jade theme
- **Bat** - Syntax highlighting cat replacement
- **Eza** - Modern ls replacement with icons
- **Go** modules - `~/go/bin` in PATH
- **Cargo** (Rust) - `~/.cargo/bin` in PATH
- **npm** global - `~/.npm-global/bin` in PATH
- **Starship** - Optional prompt (commented out)
- **fnm** - Fast Node Manager (commented out)
- **mise** - asdf alternative (commented out)
- **direnv** - Environment switcher (commented out)

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

- `man <command>` Manual for command (colored)
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

- Completion cache refreshed only once per day (checks date)
- Fast ESC key response (KEYTIMEOUT=1)
- Shared history across all terminal sessions
- Conditional loading for optional tools (fnm, mise, direnv)
- History features: expire duplicates first, verify before execution

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

## 📋 Startup Message

```
🌊 Osaka Jade Shell - Ready!
💡 Type 'reload' to refresh config
```
