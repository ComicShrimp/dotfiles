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
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"

# MacOS config directory
export XDG_CONFIG_HOME="$HOME/.config"
