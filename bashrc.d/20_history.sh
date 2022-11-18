#!/bin/bash

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend
history -a

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# disable history expansion (!)
set +o histexpand

# Flush bash history immediately
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
