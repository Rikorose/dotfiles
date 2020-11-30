#!bash

# If SWAYSOCK is empty check if there is a running sway instance
if [[ -z $SWAYSOCK ]]; then
  sway_pid=$(pgrep -x sway)

  if [ "$?" -eq 0 ]; then
    # If yes, define sway specific shortcuts and export SWAYSOCK

    # Open files via fzf + swaymsg
    bind -x '"\C-o": fzf-open'
    # Set swaysock env variable if not set already
    : ${SWAYSOCK:=/run/user/$(id -u)/sway-ipc.$(id -u).$sway_pid.sock}
    export SWAYSOCK
    export XDG_CURRENT_DESKTOP=sway
    alias pdf='swayexec zathura'
  else
    export SWAYSOCK=-1
  fi
fi
