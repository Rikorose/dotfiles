#!bash

# If SWAYSOCK is empty check if there is a running sway instance
if [[ -z $SWAYSOCK ]]; then
  sway_pid=$(pgrep -x sway)

  if [ "$?" -eq 0 ]; then
    # Set swaysock env variable if not set already
    SWAYSOCK="/run/user/$(id -u)/sway-ipc.$(id -u).$sway_pid.sock"
    export SWAYSOCK
    export XDG_CURRENT_DESKTOP=sway
  else
    export SWAYSOCK=-1
  fi
fi

if [ "$SWAYSOCK" != "-1" ]; then
  # Open files via fzf + swaymsg
  bind -x '"\C-o": fzf-open'
  alias pdf='swayexec zathura'
fi
