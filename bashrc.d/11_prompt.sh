#!bash
PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

function __branch {
  git branch 2>/dev/null --show-current | ifne awk '{ print "@"$1 }'
}

[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u\$(__branch):\W]\\$ "

SHEL=/bin/bash
