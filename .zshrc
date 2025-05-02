# Zsh history configuration
HISTFILE=$HOME/.zsh_history   # Set the history file
HISTSIZE=50000                # Set the history size
SAVEHIST=$HISTSIZE            # Set the history file size
HISTDUP=erase                 # Ignore duplicates

setopt appendhistory          # Append entries to the history
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Configure editors
EDITOR="nvim"
VISUAL="code"

# Load aliases
source $HOME/.config/aliases/aliases.sh

# Load profile config
source $HOME/.profile

# Load fzf keybindings
source <(fzf --zsh)


# Zsh configuration (Zinit and starship)
autoload -Uz compinit && compinit

# Load zinit
source $HOME/.config/zinit/zinit.zsh

# Load starship
eval "$(starship init zsh)"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Commands config
export FZF_DEFAULT_OPTS="--tmux 90% --layout reverse --border"

# Theme for FZF
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4"


# MacOS config directory
export XDG_CONFIG_HOME="$HOME/.config"
