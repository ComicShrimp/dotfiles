# Zsh history configuration
HISTFILE=$HOME/.zsh_history   # Set the history file
HISTSIZE=50000                # Set the history size
SAVEHIST=10000                # Set the history file size

# Configure editors
EDITOR="nvim"
VISUAL="code"


setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Load aliases
source $HOME/.config/aliases/aliases.sh

# Load profile config
source $HOME/.profile

# Zsh configuration (Zinit and starship)
autoload -Uz compinit && compinit
source $HOME/.config/zinit/zinit.zsh
eval "$(starship init zsh)"

# Commands config
export FZF_DEFAULT_OPTS="--tmux 90% --layout reverse --border"
