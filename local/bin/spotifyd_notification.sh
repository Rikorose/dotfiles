#!/bin/bash

SP_NOTIFY_SOW_ART=${SP_NOTIFY_SOW_ART:-1} # Show album art or show play suymbol
SP_NOTIFY_TIMOUT=${SP_NOTIFY_TIMOUT:-8000} # In ms

if [[ "$PLAYER_EVENT" == "stop" ]]; then
  exit
fi

# Parse metadata using awk instead of using sp eval, since the latter seems broken.
# TODO:
# Remove this when https://github.com/Spotifyd/spotifyd/issues/503 is resolved
counter=0
while [[ "$counter" -lt 100 ]]; do
  # Try for 30s to get metadata
  meta=$(sp metadata)
  size=${#meta}
  if [[ "$size" -gt 0 ]]; then
    break
  fi
  counter=$((counter+1))
  sleep 0.3
done
if [[ "$size" -eq 0 ]]; then
  echo "Error getting metadata."
  exit
fi

function parse-meta {
  echo "$meta" | awk -F "|" -v query="$2" '{ if ($1 == query) { print $2} }'
}

title=$(parse-meta "$meta" "title")
artist=$(parse-meta "$meta" "artist")

if [[ "$SP_NOTIFY_SOW_ART" -eq 1 ]]; then
  art_url=$(parse-meta "$meta" "artUrl")
  icon="/tmp/spotifyd_art_img.jpg"
  curl -s "$art_url" > "$icon"
else
  icon="media-playback-start"
fi

notify-send \
  --urgency=normal \
  --expire-time="$SP_NOTIFY_TIMOUT" \
  --icon="$icon" \
  --app-name=spotifyd \
  "Playing $title" \
  "$artist"

if [[ "$SP_NOTIFY_SOW_ART" -eq 1 ]]; then
  rm "$icon"
fi
