#!/bin/bash

preferred_player="youtube-music"

player=$(playerctl -l 2>/dev/null | head -n 1)

if [[ -z "$player" ]]; then
    setsid "$preferred_player" >/dev/null 2>&1 &
    sleep 3
    player=$(playerctl -l 2>/dev/null | head -n 1)
fi

# Rofi theme path
rofi_theme="$HOME/.config/rofi/musicPlayer/style.rasi"


title=$(playerctl -p "$player" metadata title)
artist=$(playerctl -p "$player" metadata artist)
album=$(playerctl -p "$player" metadata album)
artUrl=$(playerctl -p "$player" metadata mpris:artUrl | sed 's/^file:\/\///')

info="🎵 $title — $artist [$album]"

options="󰒮\n▶\n󰒭\n\n"

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
    "▶")
        playerctl -p "$player" play
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
    "")
        playerctl -p "$player" stop
    ;;
    "")
        if [[ -f "$artUrl" ]]; then
            notify-send "🎶 $title" "$artist — $album" --icon="$artUrl"
        else
            notify-send "🎶 $title" "$artist — $album"
        fi
    ;;
esac
