#!/bin/sh

langs=(
  "python"
  "rust"
)

commands=(
  "git"
  "stow"
)

selected=$({ printf "%s\n" "${langs[@]}"; printf "%s\n" "${commands[@]}"; } | fzf --reverse)
read -p "Query($selected): " query

# Change " " for "+"
query=`echo $query | tr ' ' '+'`

if [[ $langs == $selected ]]; then
  curl -s "cht.sh/$selected/$query" | bat
elif [[ $commands == $selected ]]; then
  curl -s "cht.sh/$selected~$query" | bat
else
  echo `"$selected" is not defined in any list!`
  echo `  Please use "curl cht.sh/$selected/$query" if it is a language`
  echo `  Or use "curl cht.sh/$selected~$query" if it is a tool`
fi

# while [ : ]; do sleep 1; done
