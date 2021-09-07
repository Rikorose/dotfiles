#!/bin/sh

SPOTIFYICON=""
PAUSEICON=''

playerctl -F --player=spotify metadata --format '{"text": "{{artist}} - {{title}}", "alt": "{{status}}", "class": "{{status}}", "tooltip": "{{playerName}}: {{artist}} - {{title}}"}'
