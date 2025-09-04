#!/usr/bin/env bash

player=$(playerctl -l 2>/dev/null | head -n 1)

status=$(playerctl -p "$player" status 2>/dev/null)
play=$([[ "$status" == "Playing" ]] && echo "⏸" || echo "▶")

options="$play"

choice=$(echo -e "$options")

case "$choice" in
  "$play")
    if [[ "$status" == "Playing" ]]; then
      playerctl -p "$status" pause
    else
      playerctl -p "$player" play
    fi
  ;;
esac
