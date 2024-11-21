#!/bin/bash

SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
	echo "Initialising new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"
	echo succeeded
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" >/dev/null
	#  /usr/bin/ssh-add;
}

if [[ -n "$DESKTOP_SESSION" ]] && [[ -x $(command -v gnome-keyring-daemon) ]]; then
	# eval "$(gnome-keyring-daemon --start --components=ssh,secrets)"
	# export SSH_AUTH_SOCK
	SSH_AUTH_SOCK=$(ss -xl | grep -o '/run/user/1000/keyring*/ssh')
	[ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK
elif [[ -x $(command -v /usr/bin/keychain) ]]; then
	KEYS=$(ls "$HOME"/.ssh/id_* | rg -v "\.pub")
	eval $(/usr/bin/keychain --eval "$KEYS")
elif [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" >/dev/null
	ps ${SSH_AGENT_PID} >/dev/null
else
	start_agent
fi
