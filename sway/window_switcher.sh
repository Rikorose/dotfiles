#!/bin/bash
windows=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]?)|select(.type=="con"),select(.type=="floating_con")|(.id|tostring)+" "+.name')

selected=$(echo "$windows" | rofi -dmenu -i | awk '{print $1}')

swaymsg [con_id="$selected"] focus
