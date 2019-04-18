#!/bin/sh
cmdlist | fzf --color=bw --reverse | xargs -r swaymsg -t command exec
