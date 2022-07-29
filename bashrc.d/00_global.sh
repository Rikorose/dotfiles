#!/bin/bash

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/node_modules/.bin:$PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.local/lib64/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.local/lib/

if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi
