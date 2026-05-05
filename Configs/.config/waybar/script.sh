#!/bin/bash

# Rutas
LAYOUTS_DIR="$HOME/.config/waybar/Layouts"
CSS_DIR="$HOME/.config/waybar/CSS"
CONFIG_FILE="$HOME/.config/waybar/config.jsonc"
STYLE_FILE="$HOME/.config/waybar/style.css"
ROFI_THEME="$HOME/.config/rofi/launcher/style.rasi"

# Verificar que existan layouts
if ! ls "$LAYOUTS_DIR"/*.jsonc >/dev/null 2>&1; then
    notify-send "Waybar Layouts" "No se encontraron archivos .jsonc en $LAYOUTS_DIR"
    exit 1
fi

# Obtener nombres de layouts (sin extensión)
layouts=$(ls "$LAYOUTS_DIR"/*.jsonc | xargs -n1 basename | sed 's/\.jsonc$//')

# Mostrar menú con rofi
selected=$(echo "$layouts" | rofi -dmenu -i -p "󰕴 Layout" -theme "$ROFI_THEME")

# Salir si no se selecciona nada
[[ -z "$selected" ]] && exit 0

# Verificar que exista el archivo CSS correspondiente
css_file="$CSS_DIR/$selected.css"
if [[ ! -f "$css_file" ]]; then
    notify-send "Waybar Layouts" "Advertencia: No se encontró $selected.css en $CSS_DIR"
fi

# Aplicar configuración
cp "$LAYOUTS_DIR/$selected.jsonc" "$CONFIG_FILE"

# Generar style.css con @import
echo "@import \"$css_file\";" > "$STYLE_FILE"

# Reiniciar Waybar
pkill waybar
waybar &>/dev/null & disown

# Notificación opcional
notify-send "Waybar" "Layout aplicado: <b>$selected</b>"
