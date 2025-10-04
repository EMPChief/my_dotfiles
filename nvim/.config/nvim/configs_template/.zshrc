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

- `z <directory>` Jump to directory (smart cd)
- `z <partial>` Fuzzy match directory name
- `zi` Interactive directory selection with FZF
- `z -` Go to previous directory
- `..` Go up one directory
- `...` Go up two directories
- `....` Go up three directories
- `cdf` Interactive directory search with FZF preview

---

## 📁 File Listing (Eza)

- `ls` List files (icons, git status, no details)
- `la` List all files including hidden
- `ll` Long listing with all details
- `lt` Tree view (2 levels)
- `lta` Tree view with hidden files

---

## 🔍 FZF (Fuzzy Finder)

- `Ctrl+t` Search files in current directory
- `Ctrl+r` Search command history
- `Alt+c` Search and cd into directory
- `**<Tab>` Trigger FZF completion (e.g., `vim **<Tab>`)
- `search <term>` Ripgrep search with FZF preview

### FZF Git Shortcuts (if fzf-git.sh installed)

- `Ctrl+g Ctrl+f` Search Git files
- `Ctrl+g Ctrl+b` Search Git branches
- `Ctrl+g Ctrl+t` Search Git tags
- `Ctrl+g Ctrl+h` Search Git commit history
- `Ctrl+g Ctrl+r` Search Git remotes

---

## 📖 File Viewing (Bat)

- `cat <file>` View file with syntax highlighting
- `bat <file>` Same as cat (aliased)
- `bat --theme` List available themes

---

## 🔧 Git Aliases

- `gs` Git status
- `ga` Git add
- `gc` Git commit
- `gp` Git push
- `gl` Git log (oneline, graph, decorated)
- `gd` Git diff
- `gco` Git checkout
- `gcb` Git checkout -b (create new branch)
- `lg` Launch lazygit
- `lzd` Launch lazydocker

---

## 🐳 Docker Aliases

- `dps` Docker ps
- `dpa` Docker ps -a (all containers)
- `di` Docker images
- `drm` Docker rm (remove container)
- `drmi` Docker rmi (remove image)
- `dstop` Docker stop
- `dstart` Docker start
- `dlogs` Docker logs -f (follow logs)
- `dexec` Docker exec -it (interactive shell)
- `dprune` Docker system prune (remove ALL unused data)
- `dclean` Docker cleanup (containers, images, volumes)

---

## 🛠️ Utility Functions

- `mkcd <name>` Create directory and cd into it
- `extract <file>` Extract any archive (zip, tar, gz, etc.)
- `search <term>` Search text in files with preview
- `killport <port>` Kill process running on specified port
- `weather [location]` Show weather forecast
- `gignore <templates>` Fetch gitignore templates (e.g., `gignore python,node`)

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
- `zsh-completions` Additional completion definitions
- `colored-man-pages` Colorized man pages
- `command-not-found` Suggests packages when command not found
- `sudo` Press ESC twice to prepend sudo to current/previous command
- `copypath` Copy current path to clipboard with `copypath`
- `copyfile` Copy file contents to clipboard with `copyfile <file>`
- `web-search` Search web from terminal (e.g., `google <query>`, `ddg <query>`)
- `docker` Docker completions and aliases
- `kubectl` Kubernetes completions and aliases
- `npm` NPM completions
- `rust` Cargo completions

---

## 🎨 Theme & Tools

- **Theme**: Agnoster (shows git status, path) or Starship (if enabled)
- **FZF**: Osaka Jade color scheme
- **Bat**: Tokyo Night theme
- **Prompt**: Shows username@hostname, current directory, git branch
- **Auto-update**: Oh-My-Zsh updates automatically

---

## 🌐 Environment Variables

- `$EDITOR` = nvim
- `$VISUAL` = nvim
- `$PAGER` = less
- `$GOPATH` = ~/go
- `$BAT_THEME` = tokyonight_night

---

## 📦 Package Managers Configured

- **Homebrew** (`brew`) - Linux package manager
- **Go** modules (`go get`, `go install`)
- **Cargo** (Rust) - `~/.cargo/bin` in PATH
- **npm** global - `~/.npm-global/bin` in PATH
- **fnm** (Fast Node Manager) - If installed
- **mise** (asdf alternative) - If installed

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

## 🎯 Custom Keybindings

### Zsh Defaults
- `Ctrl+a` Jump to beginning of line
- `Ctrl+e` Jump to end of line
- `Alt+f` Move forward one word
- `Alt+b` Move backward one word
- `Ctrl+d` Delete character or exit shell
- `Alt+d` Delete word forward
- `Alt+Backspace` Delete word backward

### Custom Additions
- `Ctrl+r` History incremental search (backward)
- `↑` History search backward (with prefix)
- `↓` History search forward (with prefix)
- `ESC ESC` Prepend sudo to current/previous command (from sudo plugin)

---

## 💡 Pro Tips

- **Accept suggestion**: Press `→` (right arrow) to accept autosuggestion
- **Partial accept**: Press `Ctrl+→` to accept one word
- **Navigate suggestions**: Use `↑` and `↓` for history
- **Clear suggestions**: Press `Ctrl+c`
- **Case-insensitive completion**: Type lowercase, matches any case
- **Glob patterns**: Use `*`, `**`, `?` for advanced matching
- **Background jobs**: Add `&` at end of command
- **Job control**: `Ctrl+z` to suspend, `fg` to resume

---

## 🔧 Config Files

- `~/.zshrc` Main zsh configuration
- `~/.zhistory` Command history file
- `~/.oh-my-zsh/` Oh-My-Zsh installation directory
- `~/.config/` Modern config location for various tools
- `~/.zcompdump` Completion cache (auto-refreshed daily)

---

## 🆘 Getting Help

- `man <command>` Manual for command (colored)
- `<command> --help` Quick help
- `which <command>` Show command location
- `type <command>` Show command type (alias, function, binary)
- `alias` List all aliases
- `bindkey` List all key bindings

---

## 🔐 Security Features

- Commands starting with space are not saved to history
- All eval commands check if tools exist before running
- No secrets logged or exposed

---

## ⚡ Performance Optimizations

- Completion cache refreshed only once per day
- Conditional tool loading (only if installed)
- Fast ESC key response (KEYTIMEOUT=1)
- Shared history across sessions
