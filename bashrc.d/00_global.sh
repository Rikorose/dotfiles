#!bash

if [[ :$PATH: != *:"$HOME/.local/bin":* ]] ; then
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="$HOME/bin:$PATH"
fi

. /etc/bashrc
