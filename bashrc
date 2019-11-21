# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Setup ssh agent
SSH_ENV="$HOME/.ssh/env"

function start_agent {
  if [ -S "$SSH_AUTH_SOCK" ]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
  else
    if [ ! -S ~/.ssh/ssh_auth_sock ]; then
      echo "Initialising new SSH agent..."
      eval `ssh-agent`
      ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
      echo succeeded
    fi
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
    ssh-add -l > /dev/null || ssh-add
  fi
}

# Source SSH settings, if applicable
if [[ $- == *i* ]]; then  # Is login shell
  start_agent
fi

# User specific aliases and functions

if [ -x "$(command -v nvim)" ]; then
  export VISUAL=nvim
  export EDITOR=nvim
else
  export VISUAL=vim
  export EDITOR=vim
fi

export PROMPT_DIRTRIM=2
export PS1='[\u@\h \w]\$ '

## Helper functions
dirname() {
  # Usage: dirname "path"
  printf '%s\n' "${1%/*}/"
}
basenames() {
  # Usage: basename "path"
  # basename without suffix
  f="$(basename $1)"
  printf '%s\n' "${f%.*}"
}

## Some handy aliases

# when I think I'm in vim
alias :e=$EDITOR
alias :q='exit'
alias :w='echo not in vim'
alias :wq='echo not in vim'

# cd
alias ..="cd .."

# ls
if [ -x "$(command -v exa)" ]; then
  alias ls=exa
  alias ll='exa -l'
  alias l1='exa -1'
  alias la='exa -a'
  alias lla='exa -al'
  alias lh='exa -l'
  alias lt='exa -l --sort=modified --reverse'
  alias tree='exa --tree'
else
  alias ls='ls --color=auto'
  alias ll='ls -l'
  alias l1='ls -1'
  alias la='ls -a'
  alias lla='ls -al'
  alias lt='ll -t'
  alias lh='ll -h'
  alias lth='lt -h'
fi

# tmux 256 color support
alias tmux="env TERM=xterm-256color tmux"

# set term variable over ssh
alias ssh="TERM=xterm ssh"

# git
if [ -f /usr/share/doc/git/contrib/completion/git-completion.bash ]; then
  source /usr/share/doc/git/contrib/completion/git-completion.bash
else
  if [ ! -f $HOME/git-completion.bash ]; then
    wget -q https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
      -O $HOME/git-completion.bash
  fi
  source $HOME/git-completion.bash
fi
alias g='git'
__git_complete g __git_main

# dnf
alias dnfs='dnf search'

# mpv
_mpv_use_media_globexpr=1
_mpv_media_globexpr='@(mkv)'
if [ ! -f $HOME/mpv-completion.bash ]; then
  wget -q https://raw.githubusercontent.com/2ion/mpv-bash-completion/master/gen.lua \
    -O /tmp/gen.lua
  chmod +x /tmp/gen.lua
  /tmp/gen.lua > $HOME/mpv-completion.bash
  rm /tmp/gen.lua
fi
source $HOME/mpv-completion.bash

# fzf completion
export FZF_TMUX=1
if [ -f ~/.fzf.bash ]; then
  source ~/.fzf.bash
elif [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
 source /usr/share/fzf/shell/key-bindings.bash
fi
source ~/.fzf-plugins/history-exec.bash

if [[ $- == *i* ]] && [ -x "$(command -v sway)" ]; then
  # Open file with Ctrl-O with default application
  bind -x '"\C-o": fzf-open'
fi

if [ $(pgrep -x sway) ]; then
  # Set swaysock env variable if not set already
  : ${SWAYSOCK:=/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock}
  export SWAYSOCK
fi

alias heute-journal='mpv https://www.zdf.de/nachrichten/heute-journal'
alias libreoffice="GDK_BACKEND=wayland libreoffice"
