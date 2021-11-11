#!/bin/bash

# cd
alias ..="cd .."

# ls
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -lAGh1vX --group-directories-first'
alias lh='ll'
alias lt='ll -t'

# use custom tmp dir on lme242
HOST=$(hostname)
if [[ "$HOST" == "lme242" ]]; then
  export TMPDIR="$HOME/tmp"
  export TMUX_TMPDIR="$HOME/tmp"
  alias nvim='TMPDIR=$XDG_RUNTIME_DIR nvim'
  mkdir -p $TMPDIR
fi
# tmux 256 color support
alias tmux="env TERM=xterm-256color tmux"

# set term variable over ssh
alias ssh="TERM=xterm ssh"

# Use podman istead of docker
alias docker=podman

# dnf
alias dnfs='dnf search -C'

# Use pdf shortcut for zathura.
# When running sway, this will be overwritten so it uses swayexec.
alias pdf='zathura'

# default options for rsync
alias rsync='rsync -a --info=progress2'
alias cp-rsync='rsync'
alias mv-rsync='rsync --remove-source-files --checksum'

# Setup nnn plugins
export NNN_PLUG='o:fzopen;c:fzcd;d:diffs;m:nmount;l:launch'

# Less with colors, smart case sorting and mouse scrolling in tmux
export LESS='-Ri --mouse --wheel-lines=3'

alias suspend='sudo systemctl suspend'
alias reboot='sudo systemctl reboot'
alias poweroff='sudo systemctl poweroff'
