# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

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
fi
  alias lth='lt | head'

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

# fzf keybindings
export FZF_TMUX=0
export FZF_CTRL_R_EDIT_KEY=ctrl-e
export FZF_CTRL_R_EXEC_KEY=enter
if [ -f ~/.fzf.bash ]; then
  source ~/.fzf.bash
elif [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
  source /usr/share/fzf/shell/key-bindings.bash
fi
if [ -f ~/.fzf-plugins/history-exec.bash ]; then
  source ~/.fzf-plugins/history-exec.bash
fi

if [[ $- == *i* ]] && [ -x "$(command -v sway)" ]; then
  # Open file with Ctrl-O with default application
  bind -x '"\C-o": fzf-open'
fi

if [ $(pgrep -x sway) ]; then
  # Set swaysock env variable if not set already
  : ${SWAYSOCK:=/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock}
  export SWAYSOCK
fi

alias heute-journal='mpv --no-resume-playback https://www.zdf.de/nachrichten/heute-journal'
alias libreoffice="GDK_BACKEND=wayland libreoffice"

# Initialize conda if miniconda installation is found
__conda_setup="$('$HOME/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup

if [[ $- == *i* ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  # Start tmux if logged in via interactive ssh
  echo "Ataching to tmux session 'ssh_tmux'"
  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
elif [[ -x "$(command -v keychain)" ]]; then
  # Setup ssh agent via keychain only if not starting tmux
  eval `keychain --nogui --quiet --eval --timeout 600 --agents ssh id_rsa`
fi
