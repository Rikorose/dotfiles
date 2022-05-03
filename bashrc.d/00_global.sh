#!bash

if [[ :$PATH: != *:"$HOME/.local/bin":* ]] ; then
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="$HOME/bin:$PATH"
fi

if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi
