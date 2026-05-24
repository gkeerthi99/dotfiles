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
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

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

# NVM
export NVM_DIR="$HOME/.nvm"

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
export FZF_ALT_C_COMMAND='find .'
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
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

# ~Load completions~
autoload -Uz compinit && compinit
zinit cdreplay -q

# UI completion plugin
zinit light Aloxaf/fzf-tab

# ----- Snippets -----
zinit snippet OMZL::async_prompt.zsh
zinit snippet OMZL::compfix.zsh
zinit snippet OMZP::direnv
zinit snippet OMZL::functions.zsh

zinit snippet OMZP::command-not-found
zinit snippet OMZP::sudo

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

# Alt+s prepends 'sudo' to command 
insert_sudo () { BUFFER="sudo $BUFFER" CURSOR=${#BUFFER} }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# ───────────────────────────────────────────────────────────────────────────────
# External Tool Initialisations
# ───────────────────────────────────────────────────────────────────────────────
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # load nvm bash_completion

# bun completions
[ -s "/home/kirti/.bun/_bun" ] && source "/home/kirti/.bun/_bun"

# ───────────────────────────────────────────────────────────────────────────────
# Startup
# ───────────────────────────────────────────────────────────────────────────────
[[ $- == *i* ]] && fastfetch
