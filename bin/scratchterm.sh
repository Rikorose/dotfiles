#!/bin/sh

if ! swaymsg -t get_tree | rg -q scratchterm; then
  swaymsg exec "termite -t scratchterm"
  sleep 0.2  # Sleep 0.2s so sway can update its tree
fi
swaymsg "[title=scratchterm] scratchpad show"
