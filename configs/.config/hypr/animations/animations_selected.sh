#!/usr/bin/env bash 

hypr_config_dir="$HOME/.config/hypr"
animations_dir="$hypr_config_dir/animations"
animations_conf="$hypr_config_dir/appearance/animations.conf"
cache_dir="$HOME/.cache/"
cache_file="$cache_dir/.animations_cache"

if [ ! -d "$animations_dir" ]; then
    echo "error: no animations folder found at $animations_dir"
    exit 1
fi

animation_files=$(find "$animations_dir" -maxdepth 1 -type f -name "*.conf" -exec basename {} \;)

if [ -z "$animation_files" ]; then
    echo "error: no .conf animation files found in $animations_dir"
    exit 1
fi

selected_animation=$(echo "$animation_files" | rofi -dmenu -p "Select animation")

if [ -z "$selected_animation" ]; then
    echo "error: no animation selected"
    exit 1
fi

if [ ! -f "$animations_dir/$selected_animation" ]; then
    echo "error: selected file $selected_animation does not exist"
    exit 1
fi

if [ -f "$animations_conf" ]; then
    cp "$animations_conf" "$cache_file"
fi

echo "source = $animations_dir/$selected_animation" > "$animations_conf"

if [ $? -ne 0 ]; then
    echo "error: failed to update $animations_conf"
    if [ -f "$cache_file" ]; then
        cp "$cache_file" "$animations_conf"
        echo "restored from cache"
    fi
    exit 1
fi

echo "success: animation set to $selected_animation"

