#!/bin/sh

data=$(tr -d '\n' | base64 | tr -d '\n')

if [ -n "$TMUX" ]; then
  # Inside tmux: use passthrough, no newline
  printf "\033Ptmux;\033\033]52;c;%s\a\033\\" "$data"
else
  # Direct output
  printf "\033]52;c;%s\a" "$data"
fi
