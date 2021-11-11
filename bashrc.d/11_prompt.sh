#!/bin/bash
PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

function __branch {
  git branch 2>/dev/null --show-current | ifne awk '{ print "@"$1 }'
}

[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u\$(__branch):\w]\\$ "

# From /etc/bashrc:
# By default, we want umask to get set. This sets it for non-login shell.
# Current threshold for system reserved uid/gids is 200
# You could check uidgid reservation validity in
# /usr/share/doc/setup-*/uidgid file
if [ $UID -gt 199 ] && [ "`/usr/bin/id -gn`" = "`/usr/bin/id -un`" ]; then
   umask 002
else
   umask 022
fi

SHELL=/bin/bash
