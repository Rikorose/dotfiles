#!/bin/bash

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/node_modules/.bin:$PATH"

if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi
