#!/bin/bash

echo "Setting up Tmux with Osaka Jade theme..."
echo "========================================"
echo ""

# Detect OS/Distribution
detect_os() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$ID
    elif [ -f /etc/arch-release ]; then
        OS="arch"
    elif [ -f /etc/gentoo-release ]; then
        OS="gentoo"
    elif [ -f /etc/debian_version ]; then
        OS="debian"
    else
        OS=$(uname -s)
    fi
    echo $OS
}

# Install tmux based on OS
install_tmux() {
    local os=$(detect_os)
    
    if command -v tmux &> /dev/null; then
        echo "✓ Tmux already installed"
        return 0
    fi
    
    echo "Installing tmux on $os..."
    
    case $os in
        arch|manjaro|endeavouros)
            sudo pacman -S --noconfirm tmux git
            ;;
        ubuntu|debian|pop|linuxmint)
            sudo apt update
            sudo apt install -y tmux git
            ;;
        fedora|rhel|centos)
            sudo dnf install -y tmux git
            ;;
        opensuse*|sles)
            sudo zypper install -y tmux git
            ;;
        gentoo)
            sudo emerge --ask=n app-misc/tmux dev-vcs/git
            ;;
        nixos)
            echo "NixOS detected. Please add tmux and git to your configuration.nix:"
            echo "  environment.systemPackages = with pkgs; [ tmux git ];"
            echo "Then run: sudo nixos-rebuild switch"
            read -p "Press Enter once tmux is installed..."
            ;;
        darwin)
            if command -v brew &> /dev/null; then
                brew install tmux
            else
                echo "Error: Homebrew not found. Please install Homebrew first."
                exit 1
            fi
            ;;
        *)
            echo "Warning: Unknown distribution ($os). Trying common package managers..."
            if command -v pacman &> /dev/null; then
                sudo pacman -S --noconfirm tmux git
            elif command -v apt &> /dev/null; then
                sudo apt install -y tmux git
            elif command -v dnf &> /dev/null; then
                sudo dnf install -y tmux git
            elif command -v emerge &> /dev/null; then
                sudo emerge --ask=n app-misc/tmux dev-vcs/git
            elif command -v brew &> /dev/null; then
                brew install tmux
            else
                echo "Error: Could not find a supported package manager."
                echo "Please install tmux and git manually."
                exit 1
            fi
            ;;
    esac
}

# Main installation
install_tmux

# Backup existing tmux.conf
if [ -f "$HOME/.tmux.conf" ]; then
    timestamp=$(date +%Y%m%d_%H%M%S)
    cp ~/.tmux.conf ~/.tmux.conf.backup.$timestamp
    echo "Backed up existing .tmux.conf to ~/.tmux.conf.backup.$timestamp"
fi

# Install TPM (Tmux Plugin Manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "✓ TPM already installed"
fi

# Create Osaka Jade tmux.conf
echo "Installing Osaka Jade tmux.conf..."
cat > ~/.tmux.conf << 'TMUX_EOF'
# ============================================
# Terminal & Color Settings
# ============================================
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:RGB"

# ============================================
# Prefix Key
# ============================================
set -g prefix C-a
unbind C-b
bind-key C-a send-prefix

# ============================================
# Window Splitting
# ============================================
unbind %
bind | split-window -h -c "#{pane_current_path}"
unbind '"'
bind - split-window -v -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"

# ============================================
# Config Reload
# ============================================
unbind r
bind r source-file ~/.tmux.conf \; display "Config Reloaded!"

# ============================================
# Pane Resizing
# ============================================
bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r l resize-pane -R 5
bind -r h resize-pane -L 5
bind -r m resize-pane -Z

# ============================================
# Session Management
# ============================================
bind M-c attach-session -c "#{pane_current_path}"

# ============================================
# Mouse Support
# ============================================
set -g mouse on

# ============================================
# Vi Mode
# ============================================
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection
unbind -T copy-mode-vi MouseDragEnd1Pane

# ============================================
# Performance Tweaks
# ============================================
set -sg escape-time 10
set -g focus-events on

# ============================================
# Window Numbering
# ============================================
set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows on

# ============================================
# Status Bar Position
# ============================================
set -g status-position top

# ============================================
# OSAKA JADE THEME COLORS
# ============================================
osaka_bg="#1a1b26"
osaka_fg="#c0caf5"
osaka_selection="#33467C"
osaka_comment="#565f89"
osaka_cyan="#7dcfff"
osaka_green="#9ece6a"
osaka_jade="#73daca"
osaka_teal="#1abc9c"
osaka_purple="#bb9af7"
osaka_magenta="#c678dd"
osaka_orange="#ff9e64"
osaka_yellow="#e0af68"
osaka_red="#f7768e"
osaka_blue="#7aa2f7"
osaka_dark_bg="#16161e"
osaka_sidebar="#1f2335"

# ============================================
# Status Bar Styling - Osaka Jade
# ============================================
set -g status-style "bg=$osaka_dark_bg,fg=$osaka_fg"
set -g status-left-length 100
set -g status-right-length 100

set -g status-left "#[fg=$osaka_dark_bg,bg=$osaka_jade,bold] 󰊠 #S #[fg=$osaka_jade,bg=$osaka_dark_bg]"
set -g status-right "#[fg=$osaka_teal,bg=$osaka_dark_bg] #[fg=$osaka_dark_bg,bg=$osaka_teal] %H:%M #[fg=$osaka_jade,bg=$osaka_dark_bg] #[fg=$osaka_dark_bg,bg=$osaka_jade] 󰃭 %d-%b-%y "

set -g window-status-format "#[fg=$osaka_comment,bg=$osaka_dark_bg] #I:#W "
set -g window-status-current-format "#[fg=$osaka_dark_bg,bg=$osaka_jade,bold] #I:#W #[fg=$osaka_jade,bg=$osaka_dark_bg]"
set -g window-status-separator ""

# ============================================
# Pane Borders - Osaka Jade
# ============================================
set -g pane-border-style "fg=$osaka_selection"
set -g pane-active-border-style "fg=$osaka_jade"

# ============================================
# Message Styling
# ============================================
set -g message-style "bg=$osaka_jade,fg=$osaka_dark_bg,bold"
set -g message-command-style "bg=$osaka_teal,fg=$osaka_dark_bg,bold"

# ============================================
# Copy Mode Styling
# ============================================
set -g mode-style "bg=$osaka_jade,fg=$osaka_dark_bg"

# ============================================
# Clock Mode
# ============================================
setw -g clock-mode-colour "$osaka_jade"

# ============================================
# TPM Plugins
# ============================================
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-yank'

# ============================================
# Plugin Settings
# ============================================
set -g @resurrect-capture-pane-contents 'on'
set -g @continuum-restore 'on'
set -g @continuum-save-interval '5'
set -g @resurrect-strategy-nvim 'session'

# ============================================
# Vim-tmux-navigator Integration
# ============================================
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'

bind-key -T copy-mode-vi 'C-h' select-pane -L
bind-key -T copy-mode-vi 'C-j' select-pane -D
bind-key -T copy-mode-vi 'C-k' select-pane -U
bind-key -T copy-mode-vi 'C-l' select-pane -R

# ============================================
# Initialize TPM (keep at bottom)
# ============================================
run '~/.tmux/plugins/tpm/tpm'
TMUX_EOF

echo ""
echo "✅ Tmux configuration installed!"
echo ""
echo "Next steps:"
echo "1. Start tmux: tmux"
echo "2. Install plugins: Press Ctrl+a then Shift+i"
echo "3. Reload config: Press Ctrl+a then r"
echo ""
