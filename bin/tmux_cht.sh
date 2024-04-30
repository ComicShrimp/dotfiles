#!/bin/sh

langs=(
  "python"
  "rust"
)

commands=(
  "git"
  "stow"
)

selected=$({ printf "%s\n" "${langs[@]}"; printf "%s\n" "${commands[@]}"; } | fzf)

if [[ $langs == $selected ]]; then
  echo "You selected a language"
elif [[ $commands == $selected ]]; then
  echo "You selected a command"
fi

read -p "Enter Query: " query

echo "Hello World!" | bat
while [ : ]; do sleep 1; done
