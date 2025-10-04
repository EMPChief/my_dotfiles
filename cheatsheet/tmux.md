# Tmux Configuration Cheat Sheet

## 🎯 Prefix Key
- Prefix: `Ctrl+a` (custom, default is `Ctrl+b`)
- Send prefix to nested tmux: `Ctrl+a Ctrl+a`

---

## 🪟 Window Management

### Creating Windows
- `Ctrl+a c` New window (opens in current directory)
- `:new-window` Create new window

### Navigating Windows
- `Ctrl+a n` Next window
- `Ctrl+a p` Previous window
- `Ctrl+a 0-9` Jump to window number
- `Ctrl+a l` Last active window
- `Ctrl+a w` List windows (interactive)
- `Ctrl+a f` Find window by name

### Window Operations
- `Ctrl+a ,` Rename current window
- `Ctrl+a &` Kill current window (with confirmation)
- `Ctrl+a .` Move window to another position

---

## 📱 Pane Management

### Creating Panes
- `Ctrl+a |` Split vertically (right, opens in current directory)
- `Ctrl+a -` Split horizontally (down, opens in current directory)

### Navigating Panes (Vim Integration)
- `Ctrl+h` Move to left pane (works with Neovim)
- `Ctrl+j` Move to pane below (works with Neovim)
- `Ctrl+k` Move to pane above (works with Neovim)
- `Ctrl+l` Move to pane right (works with Neovim)
- `Ctrl+a o` Cycle through panes
- `Ctrl+a ;` Toggle last active pane
- `Ctrl+a q` Show pane numbers (then press number to jump)

### Resizing Panes
- `Ctrl+a h` Resize left (5 cells, repeatable)
- `Ctrl+a j` Resize down (5 cells, repeatable)
- `Ctrl+a k` Resize up (5 cells, repeatable)
- `Ctrl+a l` Resize right (5 cells, repeatable)
- `Ctrl+a m` Toggle pane zoom (maximize/restore)
- `Ctrl+a z` Toggle pane zoom (same as above)

### Pane Operations
- `Ctrl+a x` Kill current pane (with confirmation)
- `Ctrl+a !` Break pane into new window
- `Ctrl+a {` Move pane left
- `Ctrl+a }` Move pane right
- `Ctrl+a Ctrl+o` Rotate panes
- `Ctrl+a Space` Cycle through pane layouts

---

## 📋 Session Management

### Basic Session Commands
- `tmux` Start new session
- `tmux new -s name` Start new session with name
- `tmux ls` List sessions
- `tmux attach -t name` Attach to session
- `tmux kill-session -t name` Kill session

### Inside Tmux
- `Ctrl+a d` Detach from session
- `Ctrl+a $` Rename session
- `Ctrl+a (` Switch to previous session
- `Ctrl+a )` Switch to next session
- `Ctrl+a s` List and switch sessions
- `Ctrl+a Alt+c` Attach session in current directory

### With tmux-sessionist Plugin
- `Ctrl+a g` Go to/create session (prompts for name)
- `Ctrl+a C` Create new session (prompts for name)
- `Ctrl+a X` Kill current session (without detaching)
- `Ctrl+a S` Switch session (interactive list)
- `Ctrl+a @` Promote current pane to new session

---

## 📝 Copy Mode (Vi Mode)

### Entering Copy Mode
- `Ctrl+a [` Enter copy mode
- `Ctrl+a PgUp` Enter copy mode and scroll up

### In Copy Mode (Vi Keys)
- `v` Begin selection
- `V` Line selection
- `Ctrl+v` Block selection
- `y` Yank (copy) selection
- `Enter` Copy and exit copy mode
- `q` or `Esc` Exit copy mode

### Navigation in Copy Mode
- `h/j/k/l` Move cursor (Vim style)
- `w/b` Next/previous word
- `0/$` Start/end of line
- `gg/G` Top/bottom of buffer
- `Ctrl+f/Ctrl+b` Page down/up
- `Ctrl+d/Ctrl+u` Half page down/up
- `/` Search forward
- `?` Search backward
- `n/N` Next/previous search result

### Pasting
- `Ctrl+a ]` Paste buffer
- With tmux-yank plugin: auto-copies to system clipboard

---

## 🔍 Search & Navigate (tmux-fzf plugin)

- `Ctrl+a Ctrl+f` Open tmux-fzf menu
  - Search sessions
  - Search windows
  - Search panes
  - Search commands
  - Search keybindings

---

## 🎯 Quick Select (tmux-thumbs plugin)

- `Ctrl+a Space` Activate tmux-thumbs
  - Shows hints for URLs, file paths, git SHAs, IPs, etc.
  - Press hint letter(s) to copy to clipboard
  - Works like vimium/vimperator for tmux

---

## 🔄 Session Persistence

### tmux-resurrect (Manual)
- `Ctrl+a Ctrl+s` Save session
- `Ctrl+a Ctrl+r` Restore session
- Saves:
  - Pane layouts
  - Window names
  - Running programs
  - Neovim sessions (with strategy enabled)

### tmux-continuum (Automatic)
- Auto-saves every 5 minutes
- Auto-restores last session on tmux start
- Works seamlessly with resurrect

---

## ⚙️ Configuration & Help

### Tmux Commands
- `Ctrl+a r` Reload config file
- `Ctrl+a ?` List all key bindings
- `Ctrl+a :` Enter command mode
- `tmux list-keys` List all keybindings (outside tmux)
- `tmux info` Show server information

### Common Commands (in command mode `:`)
- `:new-window -n name` New window with name
- `:split-window -h` Horizontal split
- `:split-window -v` Vertical split
- `:resize-pane -D 5` Resize down 5 lines
- `:setw synchronize-panes on` Sync input to all panes
- `:source-file ~/.tmux.conf` Reload config

---

## 🎨 Status Bar Info

### Left Side
- Session name with Osaka jade theme

### Right Side  
- Prefix highlight (shows when prefix is active)
- Current time
- Current date

### Window List
- Shows window index and name
- Highlights active window in jade color

---

## 🔧 Advanced Features

### Mouse Support (Enabled)
- Click to select pane
- Click window in status bar to switch
- Drag pane border to resize
- Drag to select text (auto-copies)
- Right-click for context menu

### Performance Settings
- Escape time: 10ms (fast for Neovim)
- Focus events enabled (for autoread in Neovim)
- 50,000 line history buffer
- Automatic pane renaming enabled

### Window Numbering
- Base index: 1 (windows and panes start at 1)
- Automatic renumber when windows are closed

---

## 🚀 Plugin Overview

### Installed Plugins
1. **TPM** - Tmux Plugin Manager
2. **vim-tmux-navigator** - Seamless Neovim/Tmux navigation
3. **tmux-resurrect** - Save/restore sessions
4. **tmux-continuum** - Auto-save sessions
5. **tmux-yank** - System clipboard integration
6. **tmux-fzf** - Fuzzy finder for tmux objects
7. **tmux-thumbs** - Hint-based text copying
8. **tmux-prefix-highlight** - Visual prefix indicator
9. **tmux-sessionist** - Enhanced session management

### Installing/Updating Plugins
- `Ctrl+a I` Install new plugins (capital i)
- `Ctrl+a U` Update plugins (capital u)
- `Ctrl+a Alt+u` Uninstall plugins not in config

---

## 💡 Pro Tips

1. **Seamless Vim/Tmux Navigation**: Use `Ctrl+h/j/k/l` to move between Neovim splits and tmux panes without switching between modes

2. **Session Workflow**: 
   - Create project-specific sessions: `tmux new -s project-name`
   - Detach with `Ctrl+a d`, reattach anytime
   - Sessions auto-save every 5 minutes

3. **Quick File Access**: Use `Ctrl+a Space` (thumbs) to copy file paths/URLs visible on screen

4. **Zooming**: `Ctrl+a m` to maximize current pane, press again to restore - great for focusing

5. **Synchronized Panes**: `:setw synchronize-panes on` to type in all panes at once (useful for multiple servers)

6. **Search in Scrollback**: `Ctrl+a [` then `/` to search, `n/N` to navigate results

7. **Fast Fuzzy Search**: `Ctrl+a Ctrl+f` to quickly find and jump to any session/window/pane

8. **Copy to System Clipboard**: Select text in copy mode with `v`, yank with `y` - automatically copied to system clipboard

9. **Window Renaming**: `Ctrl+a ,` to give windows meaningful names for easier navigation

10. **Resurrect on Crash**: If tmux crashes, just run `tmux` and `Ctrl+a Ctrl+r` to restore your entire session

---

## 🎯 Common Workflows

### Development Setup
```bash
# Start new session for project
tmux new -s myproject

# Split into 3 panes
Ctrl+a |          # vertical split (editor | terminal)
Ctrl+a -          # horizontal split bottom right (tests/logs)

# Navigate and work
Ctrl+h/j/k/l      # move between panes
Ctrl+a m          # zoom when needed
```

### Multi-Server Management
```bash
# Create panes for each server
Ctrl+a |          # split for each server
Ctrl+a -

# SSH into servers, then
Ctrl+a :setw synchronize-panes on    # type in all at once
# Run commands on all servers
Ctrl+a :setw synchronize-panes off   # disable sync
```

### Session Switching
```bash
Ctrl+a s          # list sessions
# or
Ctrl+a Ctrl+f     # fuzzy find sessions
# or  
Ctrl+a g          # goto/create session by name
```

---

## 🔑 Quick Reference Card

| Action | Keybind |
|--------|---------|
| **Prefix** | `Ctrl+a` |
| **Reload Config** | `Ctrl+a r` |
| **Split Vertical** | `Ctrl+a \|` |
| **Split Horizontal** | `Ctrl+a -` |
| **Navigate Panes** | `Ctrl+h/j/k/l` |
| **Resize Pane** | `Ctrl+a h/j/k/l` |
| **Zoom Pane** | `Ctrl+a m` |
| **New Window** | `Ctrl+a c` |
| **Next/Prev Window** | `Ctrl+a n/p` |
| **Copy Mode** | `Ctrl+a [` |
| **Paste** | `Ctrl+a ]` |
| **Detach** | `Ctrl+a d` |
| **List Sessions** | `Ctrl+a s` |
| **Fuzzy Find** | `Ctrl+a Ctrl+f` |
| **Thumbs/Hints** | `Ctrl+a Space` |
| **Save Session** | `Ctrl+a Ctrl+s` |
| **Restore Session** | `Ctrl+a Ctrl+r` |
| **Help** | `Ctrl+a ?` |

---

## 📚 Learn More

- `man tmux` - Full tmux manual
- `Ctrl+a ?` - List all keybindings
- `tmux list-commands` - All available commands
- GitHub: [tmux/tmux](https://github.com/tmux/tmux)
- Plugin Manager: [TPM](https://github.com/tmux-plugins/tpm)
