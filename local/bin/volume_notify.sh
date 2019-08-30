#!/bin/bash

set -e

# TODO: Icon search path does not work in mako for me
ICON_PATH="/usr/share/icons/breeze-dark/status/symbolic/"
ICON_EXT=".svg"

SINK=$( pactl list short sinks | rg RUNNING | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )
SINK=${SINK:=0}  # If variable not set or null, set it to default.
MUTE=$( pactl list sinks | grep '^[[:space:]]Mute:' | sed "$(( $SINK + 1 ))q;d" | rg -q 'yes'; echo $? )
NOW=$( pactl list sinks | grep '^[[:space:]]Volume:' | sed "$(( $SINK + 1 ))q;d" | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )

if [ $MUTE -eq 0 ] || [ $NOW -eq 0 ]; then
  NOW=0
  ICON="audio-volume-muted-symbolic"
elif [ $NOW -le 30 ]; then
  ICON="audio-volume-low-symbolic"
elif [ $NOW -le 70 ]; then
  ICON="audio-volume-medium-symbolic"
else
  ICON="audio-volume-high-symbolic"
fi

makoctl dismiss
notify-send " " -i $ICON_PATH$ICON$ICON_EXT -h int:value:$NOW -h string:synchronous:volume -c audio
