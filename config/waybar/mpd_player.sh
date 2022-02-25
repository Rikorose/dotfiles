#!/bin/bash

if [[ "$#" -ne 1 ]]; then
  echo "Usage $0 <player_name>"
fi

if [[ "$1" == *"spotify"* ]]; then
  # Include artist in text
  playerctl -F --player="$1" metadata --format '{"text": "{{artist}} - {{title}}", "alt": "{{status}}", "class": "{{status}}", "tooltip": "{{playerName}}: {{markup_escape(artist)}} - {{markup_escape(title)}}"}'
else
  playerctl -F --player="$1" metadata --format '{"text": "{{title}}", "alt": "{{status}}", "class": "{{status}}", "tooltip": "{{playerName}}: {{markup_escape(artist)}} - {{markup_escape(title)}}"}'
fi
