# Core | Alias to core commands
alias ls='ls --color'

# Pacman

alias paci="sudo pacman -S"   # Install package
alias pacu="sudo pacman -Syu" # Update system

# Paru

alias parui="paru -S"   # Install package
alias paruu="paru -Syu" # Update system

# Yay

alias yayi="yay -S"   # Install package
alias yayu="yay -Syu" # Update system

# Flatpak
alias fpu="flatpak update"

# Git
alias ga="git add"
alias gc="git commit"
alias gr="git restore"
alias gpl="git pull"
alias gph="git push"

# Lazygit

alias lg="lazygit"

# Tmux
alias tm="tmux a || tmux new -s Main"

# Eza alias
if command -v eza &> /dev/null; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
fi
