#!bash

if [[ -n "$DESKTOP_SESSION" ]] && [[ -x $(command -v gnome-keyring-daemon) ]]; then
  eval $(gnome-keyring-daemon --start --components=ssh,se)
  export SSH_AUTH_SOCK
fi
