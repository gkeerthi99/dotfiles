# ───────────────────────────────────────────────────────────────────────────────
# Shell Behaviour
# ───────────────────────────────────────────────────────────────────────────────
autoload -U select-word-style
select-word-style bash

# Emacs keymap
bindkey -e

# ----- History system -----
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt extendedglob

zshaddhistory() {
   whence ${${(z)1}[1]} >| /dev/null || return 1 
}

# ───────────────────────────────────────────────────────────────────────────────
# Environment Variables
# ───────────────────────────────────────────────────────────────────────────────

# ----- PATH -----
# Remove duplicates
typeset -U path

# Add paths
path+=(
   "$HOME/go/bin"
   "$HOME/.bun/bin"
   "$HOME/.local/bin"
   "$HOME/.luarocks/bin" 
   "$HOME/.opencode/bin" 
)

# Hardhat theme for fzf
export FZF_DEFAULT_OPTS=" \
--color=border:#3d464c \
--color=bg:#222629,bg+:#2b3135,hl:#bcc313 \
--color=fg:#646f73,fg+:#b6c2cc,hl+:#cfd55f \
--color=pointer:#4ab0d6,marker:#86c7e3 \
--color=spinner:#b6c2cc,info:#d7ae00 \
--color=header:#d77d20,prompt:#2ca4aa \
--multi"

export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ───────────────────────────────────────────────────────────────────────────────
# Zinit
# ───────────────────────────────────────────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if not already installed
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# ----- Plugins -----
zinit ice blockf
zinit light zsh-users/zsh-completions

zinit light zsh-users/zsh-autosuggestions
zinit wait lucid for \
  zsh-users/zsh-syntax-highlighting

# ~Load completions~
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  echo -e " \e[90m.//FULL compinit...\e[0m"
  compinit
done
compinit -C

zinit cdreplay -q

# UI completion plugin
zinit light Aloxaf/fzf-tab

# ----- Snippets -----
zinit wait lucid for \
  OMZL::compfix.zsh \
  OMZP::direnv \
  OMZL::functions.zsh \
  OMZP::command-not-found \
  OMZP::sudo

# ───────────────────────────────────────────────────────────────────────────────
# Completion Styling
# ───────────────────────────────────────────────────────────────────────────────
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# ───────────────────────────────────────────────────────────────────────────────
# Aliases
# ───────────────────────────────────────────────────────────────────────────────
alias ls='eza -ax --group-directories-first --icons=auto'
alias ll='eza -ahl --git --git-repos --group-directories-first --icons=auto --no-user'
alias lt='eza -a --git-ignore --group-directories-first --icons=auto --level=6 --tree'
alias vim='nvim'

# ───────────────────────────────────────────────────────────────────────────────
# Keybindings
# ───────────────────────────────────────────────────────────────────────────────
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ───────────────────────────────────────────────────────────────────────────────
# External Tool Initialisations
# ───────────────────────────────────────────────────────────────────────────────

# Cache directory
ZSH_CACHE_DIR="$HOME/.cache/zsh"
mkdir -p "$ZSH_CACHE_DIR"

_cache_eval() {
  local name="$1"
  local cache="$ZSH_CACHE_DIR/$1.zsh"
  shift
  if [[ ! -s "$cache" ]] || [[ "$(command -v "$1")" -nt "$cache" ]]; then
    echo -e " \e[90m.//Recompiling cache...\e[0m"
    "$@" > "$cache"
    rm -f "$cache.zwc"
    zcompile "$cache"
  fi
  source "$cache"
}

_cache_eval fzf fzf --zsh
_cache_eval zoxide zoxide init --cmd cd zsh
_cache_eval starship starship init zsh
_cache_eval brew /home/linuxbrew/.linuxbrew/bin/brew shellenv

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# NVM
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
sdk() {
  unset -f sdk
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  sdk "$@"
}

# ───────────────────────────────────────────────────────────────────────────────
# Startup
# ───────────────────────────────────────────────────────────────────────────────
[[ $- == *i* ]] && fastfetch
