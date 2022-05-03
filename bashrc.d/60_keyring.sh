#!/bin/bash

SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
  echo "Initialising new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
#  /usr/bin/ssh-add;
}

if [[ -n "$DESKTOP_SESSION" ]] && [[ -x $(command -v gnome-keyring-daemon) ]]; then
  eval "$(gnome-keyring-daemon --start --components=ssh,se)"
  export SSH_AUTH_SOCK
elif [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  ps ${SSH_AGENT_PID} > /dev/null
else
  start_agent;
fi
