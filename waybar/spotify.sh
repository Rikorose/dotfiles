#!/bin/sh

class=$(playerctl metadata --player=spotify --format '{{lc(status)}}')
icon=""
pause_icon=''

if [[ $class == "playing" ]]; then
  info=$(playerctl metadata --player=spotify --format '{{artist}} - {{title}}')
  if [[ ${#info} > 40 ]]; then
    info=$(echo $info | cut -c1-40)"..."
  fi
  text=$info" "$icon
  class="spotify"
elif [[ $class == "paused" ]]; then
  text="$pause_icon $icon"
  class="spotify"
elif [[ $class == "stopped" ]]; then
  text=""
fi

echo -e "{\"text\": \""$text"\", \"class\": \"custom-"$class"\", \"alt\": \""$class"\"}"
