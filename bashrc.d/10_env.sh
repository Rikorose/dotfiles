#!bash

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
fi

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

# dnf
alias dnfs='dnf search'

alias pdf='zathura'

# default options for rsync
alias rsync='rsync -a --info=progress2'
alias cp-rsync='rsync'
alias mv-rsync='rsync --remove-source-files --checksum'

alias heute-journal='ytplay https://www.zdf.de/nachrichten/heute-journal --no-resume-playback'

# Setup nnn plugins
export NNN_PLUG='o:fzopen;c:fzcd;d:diffs;m:nmount;l:launch'
