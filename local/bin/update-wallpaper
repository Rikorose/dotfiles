#!/bin/bash

# If SWAYSOCK is not defined, try to load it from the file `~/.swaysock`.
# This file has to be created after starting sway, i.e. in `~/bin/sway-run`.
: ${SWAYSOCK:=$(cat $HOME/.swaysock)}
export SWAYSOCK

swaymsg "output * bg ~/wallpaper fill"
