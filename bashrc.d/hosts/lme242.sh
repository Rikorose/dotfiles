#!/bin/bash

# use custom tmp dir on lme242
export TMPDIR="$HOME/tmp"
export TMUX_TMPDIR="$HOME/tmp"
alias nvim='TMPDIR=$XDG_RUNTIME_DIR nvim'
mkdir -p "$TMPDIR"

if [[ $- == *i* ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  # Start tmux if logged in via interactive ssh
  echo "Ataching to tmux session 'ssh_tmux'"
  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi
