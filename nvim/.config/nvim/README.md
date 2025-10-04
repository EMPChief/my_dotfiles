# Neovim Configuration (AstroNvim v5+)

Personal Neovim setup based on [AstroNvim](https://github.com/AstroNvim/AstroNvim) with custom plugins and integrations.

## 🛠️ Installation

### Backup existing config

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Clone this repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

### Start Neovim

```shell
nvim
```

## 📦 Plugins & Features

### Core Plugins
- **Treesitter** - Advanced syntax highlighting and code parsing
- **nvim-ts-autotag** - Auto close and rename HTML tags
- **Copilot** - AI-powered code completion
- **Harpoon** - Quick file navigation and marking
- **Oil.nvim** - File explorer as a buffer
- **Persistence** - Automatic session management
- **vim-tmux-navigator** - Seamless navigation between tmux and vim panes
- **nvim-cmp** - Autocompletion engine
- **Mason** - LSP/DAP/Linter installer
- **none-ls** - Formatting and diagnostics
- **OpenCode** - AI assistant integration

### Theme
- **Tokyo Night** - Color scheme matching the overall system theme

### Community Plugins
- Includes **AstroCommunity** plugin ecosystem for extended functionality

## ⚙️ Configuration Structure

```
~/.config/nvim/
├── lua/
│   ├── plugins/          # Plugin configurations
│   │   ├── astrocore.lua
│   │   ├── astrolsp.lua
│   │   ├── copilot.lua
│   │   ├── harpoon.lua
│   │   ├── oil.lua
│   │   ├── opencode.lua
│   │   └── ...
│   ├── community.lua     # AstroCommunity imports
│   ├── lazy_setup.lua    # Lazy.nvim setup
│   └── polish.lua        # Final config polish
├── configs_template/     # Shell config templates
│   ├── .zshrc
│   ├── .tmux.conf
│   ├── ZSH_CHEATSHEET.md
│   └── TMUX_CHEATSHEET.md
└── init.lua             # Entry point
```

## 🔧 Shell & Terminal Integration

### Zsh Configuration
- **Location**: `configs_template/.zshrc`
- **Theme**: Oh-My-Zsh with Agnoster
- **Tools**: FZF, Zoxide, Bat, Eza, TheFuck
- **Color Scheme**: Osaka Jade (custom FZF theme)
- See [ZSH_CHEATSHEET.md](configs_template/ZSH_CHEATSHEET.md) for details

### Tmux Configuration
- **Location**: `configs_template/.tmux.conf`
- **Integration**: vim-tmux-navigator for seamless pane navigation
- See [TMUX_CHEATSHEET.md](configs_template/TMUX_CHEATSHEET.md) for keybindings

## 🚀 Quick Start

After installation, key commands:
- `<leader>` = `Space` (default)
- File explorer: `<leader>e` or use Oil.nvim
- Find files: `<leader>ff`
- Search text: `<leader>fw`
- Harpoon mark: `<leader>a`
- Session restore: Automatic via Persistence

## 📚 Documentation

- [ZSH Cheatsheet](configs_template/ZSH_CHEATSHEET.md)
- [Tmux Cheatsheet](configs_template/TMUX_CHEATSHEET.md)
- [AstroNvim Docs](https://docs.astronvim.com)

## 🎨 Theme

Consistent **Tokyo Night** theming across:
- Neovim (tokyonight.nvim)
- Zsh prompt (Agnoster)
- Bat syntax highlighting
- FZF (Osaka Jade variant)
