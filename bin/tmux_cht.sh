#!/bin/sh

LANGS_FILE=$HOME/bin/tmux_cht_sh/langs
COMMANDS_FILE=$HOME/bin/tmux_cht_sh/commands

selected=$(cat $LANGS_FILE $COMMANDS_FILE | fzf --reverse)

read -p "Query(${selected}): " query

# Change " " for "+"
query=`echo $query | tr ' ' '+'`

if grep -qs "$selected" "$LANGS_FILE"; then
  curl -s "cht.sh/${selected}/${query}" | bat
elif grep -qs "$selected" "$COMMANDS_FILE"; then
  curl -s "cht.sh/${selected}~${query}" | bat
else
  echo "'${selected}' is not defined in any list!"
  echo "  Please use 'curl cht.sh/${selected}/${query}' if it is a language"
  echo "  Or use 'curl cht.sh/${selected}~${query}' if it is a tool"

  while [ : ]; do sleep 1; done
fi
