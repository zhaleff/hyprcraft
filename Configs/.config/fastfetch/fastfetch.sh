#!/usr/bin/env bash

# Si no hay argumentos, ejecuta fastfetch
if [ -z "${*}" ]; then
  clear
  exec fastfetch --logo-type kitty
  exit
fi

case $1 in
logo)
  # Busca EXACTAMENTE tus PNGs específicos
  find assets/ -maxdepth 1 -type f \( -name "pokemon-1.png" -o -name "pokemon-2.png" -o -name "Kirby.png" -o -name "Silksong.png" -o -name "Evangelio.png" \) 2>/dev/null | shuf -n 1
  ;;
help | --help | -h)
  cat <<HELP
Usage: ${0##*/} logo  # Random entre pokemon-1.png, pokemon-2.png, Kirby.png, Silksong.png, Evangelio.png
HELP
  ;;
*)
  clear
  exec fastfetch --logo-type kitty
  ;;
esac
