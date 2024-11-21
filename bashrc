#!/bin/bash
# .bashrc

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Source all rc files in .bashrc.d
for f in ~/.bashrc.d/*.sh; do
  if [[ "$__bashrc_bench" ]]; then
    echo bench "$f"
    TIMEFORMAT="$f: %R"
    time . "$f"
    unset TIMEFORMAT
  else
    . "$f"
  fi
done
unset f

# Also source host specific rc file
[[ -e ~/.bashrc.d/hosts/$(hostname).sh ]] && . ~/.bashrc.d/hosts/$(hostname).sh
