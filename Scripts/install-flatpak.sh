#!/usr/bin/env bash

# ██╗  ██╗██╗   ██╗██████╗ ██████╗  ██████╗██████╗  █████╗ ███████╗████████╗
# ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝
# ███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ██████╔╝███████║█████╗     ██║   
# ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██╗██╔══██║██╔══╝     ██║   
# ██║  ██║   ██║   ██║     ██║  ██║╚██████╗██║  ██║██║  ██║██║        ██║   
# ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝        ╚═╝   
                                                                          

# =======================================================
# == HyprCraft                                         ==
# == Repository: https://github.com/zhaleff/hyprcraft  ==
# == Author:                                           ==
# == Script of installation for flatpak repository     ==
# == LICENCE: MIT                                      ==
# == Please be careful when running the script.
# =======================================================

echo -e "The Flatpak installation has started by..." && sleep 2 && sudo pacman -S flatpak --noconfirm && sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flahub.flatpakrepo && echo -e "Flatpak installation is complete"
