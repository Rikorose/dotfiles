#!/bin/bash

# If SWAYSOCK is empty check if there is a running sway instance
if [[ -z $SWAYSOCK ]] || [[ "$SWAYSOCK" == -1 ]]; then
  : ${SWAYSOCK:=/run/user/$(id -u)/sway-ipc.$(id -u).$(pidof sway).sock}
  if [ -d "$SWAYSOCK" ]; then
    export SWAYSOCK
  else
    export SWAYSOCK=-1
  fi
fi

if [ "$SWAYSOCK" != "-1" ]; then
  # Open files via fzf + swaymsg
  bind -x '"\C-o": fzf-open'
  alias pdf='swayexec zathura'
fi
