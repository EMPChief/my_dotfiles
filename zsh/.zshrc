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

# Faster ESC key response in vi mode
KEYTIMEOUT=1

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
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# ============================================
# External Tool Initialization (eval)
# ============================================
# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Zoxide (better cd)
eval "$(zoxide init zsh)"

# TheFuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# Starship prompt (if installed, uncomment below)
# eval "$(starship init zsh)"

# fnm (Fast Node Manager, if installed)
# eval "$(fnm env --use-on-cd)"

# mise (if installed, replaces asdf)
# eval "$(mise activate zsh)"

# direnv (if installed)
# eval "$(direnv hook zsh)"

# ============================================
# Source External Files
# ============================================
# Environment Manager (envman)
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Local environment
[ -f "$HOME/.local/share/../bin/env" ] && . "$HOME/.local/share/../bin/env"

# ============================================
# Tool Aliases
# ============================================
alias cd="z"

# ============================================
# FZF Configuration - Osaka Jade Theme
# ============================================
eval "$(fzf --zsh)"

# Osaka Jade color palette
fg="#c0caf5"          # Foreground (light blue-white)
bg="#1a1b26"          # Background (dark)
bg_highlight="#33467C" # Selection background
purple="#bb9af7"      # Purple
blue="#7aa2f7"        # Blue
cyan="#7dcfff"        # Cyan
jade="#73daca"        # Osaka Jade (main accent)
teal="#1abc9c"        # Teal
green="#9ece6a"       # Green
yellow="#e0af68"      # Yellow
red="#f7768e"         # Red

# FZF Theme
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

# FZF Commands
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# FZF Completion helpers
_fzf_compgen_path() { 
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() { 
  fd --type=d --hidden --exclude .git . "$1"
}

# FZF Git integration
[ -f ~/fzf-git.sh/fzf-git.sh ] && source ~/fzf-git.sh/fzf-git.sh

# FZF Preview configuration
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# FZF completion wrapper
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

# ============================================
# Bat Configuration (better cat)
# ============================================
export BAT_THEME="tokyonight_night"
alias cat="bat"

# ============================================
# Eza Configuration (better ls)
# ============================================
alias ls="eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions"
alias la="eza --color=always --icons=always --long --git --all"
alias ll="eza --color=always --icons=always --long --git"
alias lt="eza --color=always --icons=always --tree --level=2"
alias lta="eza --color=always --icons=always --tree --level=2 --all"

# ============================================
# Directory Navigation
# ============================================
# Enhanced cd with fzf
cdf() {
  local dir
  dir=$(fd --type d --hidden --exclude .git | fzf --preview 'eza --tree --color=always {} | head -200')
  [[ -n "$dir" ]] && cd "$dir"
}

# ============================================
# TheFuck Configuration
# ============================================
# (Moved to eval section above)

# ============================================
# Application Aliases
# ============================================
alias zen="flatpak run app.zen_browser.zen"
alias python="python3"
alias vim="nvim"
alias vi="nvim"

# AstroNvim isolated config
alias anvim='XDG_CONFIG_HOME=$HOME/.astronvim_config XDG_DATA_HOME=$HOME/.local/share/astronvim XDG_STATE_HOME=$HOME/.local/state/astronvim XDG_CACHE_HOME=$HOME/.cache/astronvim nvim'

# ============================================
# Git Aliases (additional)
# ============================================
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gd="git diff"
alias lg="lazygit"
alias lzd="lazydocker"

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
# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract any archive
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

# Quick search in files
search() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi \
        --delimiter : \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
}

# ============================================
# Startup Message
# ============================================
echo "🌊 Osaka Jade Shell - Ready!"
echo "💡 Type 'reload' to refresh config"

# ============================================
# Performance: Load completions
# ============================================
autoload -Uz compinit
if [[ $(date +'%j') != $(stat -c '%y' ~/.zcompdump 2>/dev/null | cut -d' ' -f1 | date -f - +'%j' 2>/dev/null) ]]; then
  compinit
else
  compinit -C
fi
