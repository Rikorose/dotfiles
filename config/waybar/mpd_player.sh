#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage $0 <player_name>"
fi

playerctl -F --player="$1" metadata --format '{"text": "{{title}}", "alt": "{{status}}", "class": "{{status}}", "tooltip": "{{playerName}}: {{markup_escape(title)}}"}'
