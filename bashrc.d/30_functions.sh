#!/bin/bash

isgitdir() {
  if [ -z "$1" ]; then
    DIR=$PWD
  else
    DIR=$1
  fi
  git -C "$DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1
}

function d() {
  if isgitdir; then
    git diff "$@"
  else
    diff -u "$@" | diff-so-fancy | less --tabs=4 -RFXS
  fi
}
# Also overwrite dc (cmd calculator) since the usage is pritty meh anyways
function dc() {
  git diff --cached "$@" | diff-so-fancy
}

function md() {
  if [ ! -f "$1" ]; then
    echo "usage: md <file.md>"
    exit 0
  fi
  pandoc -t plain "$1" | bat
}

function md-lynx() {
  if [ ! -f "$1" ]; then
    echo "usage: md-lynx <file.md>"
    exit 0
  fi
  pandoc "$1" | lynx -stdin
}

if [ -x "$(command -v fdfind)" ]; then
  alias fd=fdfind
fi

alias gs='git status'

alias bathelp='bat --plain --language=help'
help() {
  "$@" --help 2>&1 | bathelp
}
