#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -n 1)

# Rofi theme path
rofi_theme="$HOME/.config/rofi/music-player/style.rasi"


title=$(playerctl -p "$player" metadata title)
artist=$(playerctl -p "$player" metadata artist)
album=$(playerctl -p "$player" metadata album)
artUrl=$(playerctl -p "$player" metadata mpris:artUrl | sed 's/^file:\/\///')

loop=$(playerctl $player loop)
status=$(playerctl -p "$player" status 2>/dev/null)
info="🎵 $title — $artist [$album]"

play=$([[ "$status" == "Playing" ]] && echo "⏸" || echo "▶")
repeat=$([[ "$status" == "None" ]] && echo "󰑗" || echo "󰑖")

options="$repeat\n󰒮\n$play\n󰒭\n"

choice=$(echo -e "$options" | rofi -dmenu -theme "$rofi_theme" -mesg "🎵 $title" --icon="$artUrl")

case "$choice" in
    "󰒭")
        playerctl -p "$player" next
        sleep 2
        title=$(playerctl -p "$player" metadata title 2>/dev/null)
        artist=$(playerctl -p "$player" metadata artist 2>/dev/null)
        album=$(playerctl -p "$player" metadata album 2>/dev/null)
        artUrl=$(playerctl -p "$player" metadata mpris:artUrl 2>/dev/null | sed 's/^file:\/\///')
        
        if [[ -f "$artUrl" ]]; then
            notify-send "🎶 $title" "$artist — $album" --icon="$artUrl"
        else
            notify-send "🎶 $title" "$artist — $album"
        fi
    ;;
    "$play")
        if [[ "$status" == "Playing" ]]; then
            playerctl -p "$player" pause
        else
            playerctl -p "$player" play
        fi
    ;;
    "$repeat") 
        if [[ "$loop" == "None" ]]; then
            playerctl "$player" loop Playlist
        else
            playerctl "$player" loop None
        fi
    ;;
    "󰒮")
        playerctl -p "$player" previous
        sleep 2
        title=$(playerctl -p "$player" metadata title 2>/dev/null)
        artist=$(playerctl -p "$player" metadata artist 2>/dev/null)
        album=$(playerctl -p "$player" metadata album 2>/dev/null)
        artUrl=$(playerctl -p "$player" metadata mpris:artUrl 2>/dev/null | sed 's/^file:\/\///')
        
        if [[ -f "$artUrl" ]]; then
            notify-send "🎶 $title" "$artist — $album" --icon="$artUrl"
        else
            notify-send "🎶 $title" "$artist — $album"
        fi
    ;;
    "")
        if [[ -f "$artUrl" ]]; then
            notify-send "🎶 $title" "$artist — $album" --icon="$artUrl"
        else
            notify-send "🎶 $title" "$artist — $album"
        fi
    ;;
esac
