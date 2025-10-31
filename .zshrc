# !!!!!!!
# Stop backward kill on '/'
autoload -U select-word-style
select-word-style bash

# Set the directory we want to store zinit and plugins
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
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

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

# Monokai Classic theme for fzf
export FZF_DEFAULT_OPTS=" \
--color=bg:#272822,bg+:#1d1e19,spinner:#fdfff1,hl:#f92672 \
--color=fg:#fdfff1,fg+:#fdfff1,header:#fd971f,info:#e6db74,pointer:#ae81ff \
--color=marker:#66d9ef,prompt:#fd971f,hl+:#f92672 \
--color=border:#1d1e19 \
--multi"

export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_ALT_C_COMMAND='find .'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Export PATHs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export NPMPATH=$HOME/bin/npm/
export PATH=$PATH:$NPMPATH/bin
export PATH=$PATH:$HOME/.local/bin
export DISPLAY=:0
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
