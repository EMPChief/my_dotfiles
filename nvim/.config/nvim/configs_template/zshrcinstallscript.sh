#!/bin/bash

echo "🌊 Osaka Jade Zsh Setup"
echo "======================="
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

# Install packages based on OS
install_packages() {
    local os=$(detect_os)
    echo "Detected OS: $os"
    
    case $os in
        arch|manjaro|endeavouros)
            echo "Installing packages via pacman..."
            sudo pacman -S --needed --noconfirm zsh git curl fzf fd ripgrep bat eza zoxide
            ;;
        ubuntu|debian|pop|linuxmint)
            echo "Installing packages via apt..."
            sudo apt update
            sudo apt install -y zsh git curl fzf fd-find ripgrep bat
            # Install eza and zoxide via cargo or brew (not in apt)
            if ! command -v eza &> /dev/null; then
                echo "Installing eza via cargo..."
                cargo install eza 2>/dev/null || echo "Note: eza requires cargo. Install via: cargo install eza"
            fi
            if ! command -v zoxide &> /dev/null; then
                echo "Installing zoxide..."
                curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
            fi
            # Create symlinks for fd and bat if needed
            [ ! -e ~/.local/bin/fd ] && ln -s $(which fdfind) ~/.local/bin/fd 2>/dev/null
            [ ! -e ~/.local/bin/bat ] && ln -s $(which batcat) ~/.local/bin/bat 2>/dev/null
            ;;
        fedora|rhel|centos)
            echo "Installing packages via dnf..."
            sudo dnf install -y zsh git curl fzf fd-find ripgrep bat
            if ! command -v eza &> /dev/null; then
                cargo install eza 2>/dev/null || echo "Note: eza requires cargo"
            fi
            if ! command -v zoxide &> /dev/null; then
                curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
            fi
            ;;
        opensuse*|sles)
            echo "Installing packages via zypper..."
            sudo zypper install -y zsh git curl fzf fd ripgrep bat
            if ! command -v eza &> /dev/null; then
                cargo install eza 2>/dev/null || echo "Note: eza requires cargo"
            fi
            if ! command -v zoxide &> /dev/null; then
                curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
            fi
            ;;
        gentoo)
            echo "Installing packages via emerge..."
            sudo emerge --ask=n app-shells/zsh dev-vcs/git net-misc/curl app-shells/fzf sys-apps/fd sys-apps/ripgrep sys-apps/bat
            if ! command -v eza &> /dev/null; then
                cargo install eza 2>/dev/null || echo "Note: eza requires cargo"
            fi
            if ! command -v zoxide &> /dev/null; then
                curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
            fi
            ;;
        nixos)
            echo "NixOS detected. Please add these to your configuration.nix:"
            echo "  environment.systemPackages = with pkgs; ["
            echo "    zsh git curl fzf fd ripgrep bat eza zoxide"
            echo "  ];"
            echo "Then run: sudo nixos-rebuild switch"
            read -p "Press Enter once packages are installed..."
            ;;
        darwin)
            if command -v brew &> /dev/null; then
                echo "Installing packages via Homebrew..."
                brew install zsh git curl fzf fd ripgrep bat eza zoxide
            else
                echo "Error: Homebrew not found. Please install Homebrew first."
                exit 1
            fi
            ;;
        *)
            echo "Unknown distribution. Please install these packages manually:"
            echo "  zsh git curl fzf fd ripgrep bat eza zoxide"
            read -p "Press Enter once packages are installed..."
            ;;
    esac
}

# Install Homebrew (if not on NixOS)
install_homebrew() {
    local os=$(detect_os)
    if [ "$os" = "nixos" ]; then
        echo "Skipping Homebrew on NixOS"
        return 0
    fi
    
    if ! command -v brew &> /dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add to PATH
        if [ -d /home/linuxbrew/.linuxbrew ]; then
            eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        fi
    else
        echo "✓ Homebrew already installed"
    fi
}

# Install Oh My Zsh
install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        echo "✓ Oh My Zsh already installed"
    fi
}

# Install zsh plugins
install_zsh_plugins() {
    echo "Installing zsh plugins..."
    
    # zsh-autosuggestions
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    else
        echo "✓ zsh-autosuggestions already installed"
    fi
    
    # zsh-syntax-highlighting
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    else
        echo "✓ zsh-syntax-highlighting already installed"
    fi
}

# Install fzf-git
install_fzf_git() {
    if [ ! -d "$HOME/fzf-git.sh" ]; then
        echo "Installing fzf-git..."
        git clone https://github.com/junegunn/fzf-git.sh.git ~/fzf-git.sh
    else
        echo "✓ fzf-git already installed"
    fi
}

# Install TheFuck
install_thefuck() {
    if ! command -v thefuck &> /dev/null; then
        echo "Installing TheFuck..."
        pip3 install thefuck --user 2>/dev/null || echo "Note: TheFuck requires Python pip3"
    else
        echo "✓ TheFuck already installed"
    fi
}

# Main installation
echo "Step 1: Installing packages..."
install_packages

echo ""
echo "Step 2: Installing Homebrew..."
install_homebrew

echo ""
echo "Step 3: Installing Oh My Zsh..."
install_oh_my_zsh

echo ""
echo "Step 4: Installing zsh plugins..."
install_zsh_plugins

echo ""
echo "Step 5: Installing fzf-git..."
install_fzf_git

echo ""
echo "Step 6: Installing TheFuck..."
install_thefuck

# Backup existing .zshrc
if [ -f "$HOME/.zshrc" ]; then
    timestamp=$(date +%Y%m%d_%H%M%S)
    cp ~/.zshrc ~/.zshrc.backup.$timestamp
    echo "Backed up existing .zshrc to ~/.zshrc.backup.$timestamp"
fi

# Install new .zshrc
echo ""
echo "Step 7: Installing Osaka Jade .zshrc..."
cat > ~/.zshrc << 'ZSHRC_EOF'
# ============================================
# Oh My Zsh Configuration
# ============================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
  command-not-found
)
setopt extended_glob
source $ZSH/oh-my-zsh.sh

# ============================================
# History Configuration
# ============================================
HISTFILE=$HOME/.zhistory
HISTSIZE=100000
SAVEHIST=100000
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt hist_ignore_space

# ============================================
# Environment Variables
# ============================================
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export GOPATH="$HOME/go"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# ============================================
# PATH Configuration
# ============================================
export PATH="$HOME/.local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# ============================================
# External Tool Initialization (eval)
# ============================================
# Homebrew (if installed)
if [ -d /home/linuxbrew/.linuxbrew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ -d /opt/homebrew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Zoxide (better cd)
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi

# TheFuck
if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
  eval $(thefuck --alias fk)
fi

# ============================================
# Source External Files
# ============================================
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
[ -f "$HOME/.local/share/../bin/env" ] && . "$HOME/.local/share/../bin/env"
[ -f ~/fzf-git.sh/fzf-git.sh ] && source ~/fzf-git.sh/fzf-git.sh

# ============================================
# FZF Configuration - Osaka Jade Theme
# ============================================
if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"

  # Osaka Jade color palette
  fg="#c0caf5"
  bg="#1a1b26"
  bg_highlight="#33467C"
  purple="#bb9af7"
  blue="#7aa2f7"
  cyan="#7dcfff"
  jade="#73daca"
  teal="#1abc9c"
  green="#9ece6a"
  yellow="#e0af68"
  red="#f7768e"

  export FZF_DEFAULT_OPTS="
    --color=fg:${fg},bg:${bg},hl:${jade}
    --color=fg+:${fg},bg+:${bg_highlight},hl+:${teal}
    --color=info:${cyan},prompt:${jade},pointer:${jade}
    --color=marker:${green},spinner:${jade},header:${purple}
    --border=rounded
    --prompt='  '
    --pointer='▶'
    --marker='✓'
    --layout=reverse
    --height=60%
  "

  export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

  _fzf_compgen_path() { 
    fd --hidden --exclude .git . "$1"
  }

  _fzf_compgen_dir() { 
    fd --type=d --hidden --exclude .git . "$1"
  }

  show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

  export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
  export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

  _fzf_comprun() {
    local command=$1
    shift
    case "$command" in
      cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
      export|unset) fzf --preview "eval 'echo \${}'" "$@" ;;
      ssh)          fzf --preview 'dig {}' "$@" ;;
      *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
    esac
  }
fi

# ============================================
# Bat Configuration
# ============================================
export BAT_THEME="tokyonight_night"
if command -v bat &> /dev/null; then
  alias cat="bat"
fi

# ============================================
# Eza Configuration
# ============================================
if command -v eza &> /dev/null; then
  alias ls="eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions"
  alias la="eza --color=always --icons=always --long --git --all"
  alias ll="eza --color=always --icons=always --long --git"
  alias lt="eza --color=always --icons=always --tree --level=2"
  alias lta="eza --color=always --icons=always --tree --level=2 --all"
fi

# ============================================
# Application Aliases
# ============================================
alias python="python3"
alias vim="nvim"
alias vi="nvim"

# ============================================
# Git Aliases
# ============================================
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gd="git diff"

# ============================================
# Utility Aliases
# ============================================
alias reload="source ~/.zshrc"
alias c="clear"
alias h="history"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# ============================================
# Custom Functions
# ============================================
mkcd() {
  mkdir -p "$1" && cd "$1"
}

extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

if command -v rg &> /dev/null && command -v fzf &> /dev/null; then
  search() {
    rg --color=always --line-number --no-heading --smart-case "${*:-}" |
      fzf --ansi \
          --delimiter : \
          --preview 'bat --color=always {1} --highlight-line {2}' \
          --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
  }
fi

echo "🌊 Osaka Jade Shell - Ready!"

autoload -Uz compinit
compinit
ZSHRC_EOF

# Change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo ""
    echo "Changing default shell to zsh..."
    chsh -s $(which zsh)
    echo "Please log out and log back in for the shell change to take effect."
fi

echo ""
echo "✅ Osaka Jade Zsh setup complete!"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Enjoy your Osaka Jade themed shell!"
echo ""
