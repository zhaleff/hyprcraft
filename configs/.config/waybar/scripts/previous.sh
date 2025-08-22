#!/usr/bin/env bash

player=$(playerctl -l 2>/dev/null | head -n 1)

status=$(playerctl -p "$player" status 2>/dev/null)

options="󰒮"

choice=$(echo -e "$options")

case "$choice" in
  "󰒮")
    playerctl -p $player previous
    sleep 3
  ;;
esac
