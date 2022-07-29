#!/bin/bash

# cd
alias ..="cd .."

# ls
if [[ -x $(which lsd) ]]; then
  alias ls=lsd
  alias ll='ls -l --group-dirs first'
else
  alias ls='ls --color=auto'
  alias ll='ls -lAGh1vX --group-directories-first'
fi
alias la='ll -a'
alias lt='ll -t'
alias lll='ll -L'

# tmux 256 color support
alias tmux="env TERM=xterm-256color tmux"

# set term variable over ssh
alias ssh="TERM=xterm ssh"

# dnf
alias dnfs='dnf search -C'

# Use pdf shortcut for zathura.
# When running sway, this will be overwritten so it uses swayexec.
alias pdf='zathura'

# default options for rsync
alias rsync='rsync -a --info=name,progress2 --partial'
alias cp-rsync='rsync'
alias mv-rsync='rsync --remove-source-files --checksum'

# Setup nnn plugins
export NNN_PLUG='o:fzopen;c:fzcd;d:diffs;m:nmount;l:launch'

export LESS="-Ri"
# Less version 543+ support mouse options. Less' version numbers may
# include a dot for bugfix releases such as 543.2; thus interpret as float.
LESS_VERSION=$(less --version | head -n 1 | cut -d ' ' -f2)
if (($(echo "$LESS_VERSION >= 543" | bc -l))); then
  export LESS="$LESS --mouse --wheel-lines=3"
fi

# Use bat to colorize man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias suspend='sudo systemctl suspend'
alias reboot='sudo systemctl reboot'
alias poweroff='sudo systemctl poweroff'
