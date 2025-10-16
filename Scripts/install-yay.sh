#!/usr/bin/env bash

echo "AUR installation has started" && sleep 2 &&  sudo pacman -S --needed git base-devel -y && git clone https://aur.archlinux.org/yay.git && cd yay || exit makepkg -si --noconfirm && echo -e "AUR installation is complete"

