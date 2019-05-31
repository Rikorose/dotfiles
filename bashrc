# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Setup ssh agent
SSH_ENV="$HOME/.ssh/env"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep "ssh-agent$" > /dev/null || {
        start_agent;
    }
else
    start_agent;
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
basename() {
  # Usage: basename "path"
  : "${1%/}"
  printf '%s\n' "${_##*/}"
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
if [ -f ~/.fzf.bash ]; then
  source ~/.fzf.bash
elif [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
 source /usr/share/fzf/shell/key-bindings.bash
fi
# Directly execute reverse history search item (CTRL-R)
bind "$(bind -s | grep '^"\\C-r"' | grep -v '\\C-m' | sed 's/"$/\\C-m"/')"

# Open file with Ctrl-O with default application
bind -x '"\C-o": file="$(fzf --height 40% --reverse)" && [ -f "$file" ] && swaymsg exec xdg-open $(readlink -f "$file")'

alias heute-journal='mpv https://www.zdf.de/nachrichten/heute-journal'