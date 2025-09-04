#!/bin/bash

choices=$(cat <<EOF
⌘ + T             ⟹ Open Terminal
⌘ + ⇧ + T         ⟹ Float Terminal
⌘ + B             ⟹ Open Browser
⌘ + W             ⟹ Kill Active Window
⌘ + V             ⟹ Toggle Floating
⌘ + F             ⟹ Fullscreen On
⌘ + G             ⟹ Fullscreen Off
⌘ + E             ⟹ Open Yazi File Manager
⌘ + P             ⟹ Open Power Menu
⌘ + [⎵]           ⟹ Rofi App Launcher
⌘ + ⇧ + R         ⟹ Wallpaper Picker
⌘ + ⇧ + S         ⟹ Screenshot to Clipboard
⌥ + ⇧ + S         ⟹ Save Screenshot to File
⌥ + ⇧ + W         ⟹ Toggle Waybar
⌃ + ⇧ + W         ⟹ Restart Waybar
⌃ + ⇧ + Tab       ⟹ Task Manager
⌘ + C             ⟹ Color Picker
⌘ + I             ⟹ Random Wallpaper + Hyprpaper
⌘ + M             ⟹ Clipboard Launcher
EOF
)


echo "$choices" | rofi -dmenu -i -p "Shortcuts" -theme "$HOME/.config/rofi/shortcut/style.rasi"
