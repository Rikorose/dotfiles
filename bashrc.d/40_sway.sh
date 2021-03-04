#!bash

# If SWAYSOCK is empty check if there is a running sway instance
if [[ -z $SWAYSOCK ]]; then
  SWAYSOCK=$(sway --get-socketpath 2>/dev/null)
  if [ "$?" -eq 0 ]; then
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
