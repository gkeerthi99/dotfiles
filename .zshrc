# Stop backward kill on '/'
autoload -U select-word-style
select-word-style bash

# S" et the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git
zinit snippet OMZP::sudo

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Insert "sudo" at beginning of command
insert_sudo () { BUFFER="sudo $BUFFER" CURSOR=${#BUFFER} }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# History
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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='eza -ax --group-directories-first --icons=auto'
alias ll='eza -ahl --git --git-repos --group-directories-first --icons=auto --no-user'
alias lt='eza -a --git-ignore --group-directories-first --icons=auto --level=6 --tree'
alias vim='nvim'

# Catppuccin frappe theme for fzf
export FZF_DEFAULT_OPTS=" \
--color=border:#8caaee \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#ef9f76	 \
--color=marker:#babbf1,fg+:#c6d0f5,prompt:#ef9f76,hl+:#e78284 \
--multi
"

export FZF_DEFAULT_COMMAND='rg --files --hidden'

export FZF_ALT_C_COMMAND='find .'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Exporth PATHs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export NPMPATH=$HOME/bin/npm/
export PATH=$PATH:$NPMPATH/bin
export DISPLAY=:0

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
