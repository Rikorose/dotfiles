#!/bin/bash

SERVICE_SINK=deep_filter_sink.service
SERVICE_SOURCE=deep_filter_source.service

if [[ "$#" -ne 1 ]]; then
  echo "Usage $0 <sink/source/status>"
fi

if [[ "$1" == "status" ]]; then
  sleep 0.1s # Wait for previous sink/source command to update the systemctl service
fi

STATUS_SOURCE=$(systemctl --user is-active "$SERVICE_SOURCE")
STATUS_SINK=$(systemctl --user is-active "$SERVICE_SINK")

STATUS=""
if [[ "$STATUS_SOURCE" == "active" ]]; then
  STATUS="SOURCE"
fi
if [[ "$STATUS_SINK" == "active" ]]; then
  if test -n "$STATUS"; then
    STATUS="$STATUS:"
  fi
  STATUS="$STATUS"SINK
fi
TEXT="$STATUS"
if test -z "$STATUS"; then
  STATUS="INACTIVE"
fi

if [[ "$1" == "status" ]]; then
  echo "{\"alt\": \"$STATUS\", \"class\": \"$STATUS\", \"text\": \"$TEXT\"}"
  exit 0
elif [[ "$1" == "sink" ]]; then
  if [[ "$STATUS_SINK" == "active" ]]; then
    systemctl --user stop "$SERVICE_SINK"
  else
    systemctl --user start "$SERVICE_SINK"
  fi
elif [[ "$1" == "source" ]]; then
  if [[ "$STATUS_SOURCE" == "active" ]]; then
    systemctl --user stop "$SERVICE_SOURCE"
  else
    systemctl --user start "$SERVICE_SOURCE"
  fi
fi
