<!--
HyprCraft - Professional, Catppuccin-styled Hyprland ricing suite
All content must be in this code block. English, detailed, decorated, production-ready README.
-->

<h1 align="center">HyprCraft</h1>

<div align="center">
<p>
<a href="https://github.com/zephardev/hyprcraft/stargazers"><img src="https://img.shields.io/github/stars/zephardev/hyprcraft?style=for-the-badge&logo=starship&color=%23CBA6F7&logoColor=%23CBA6F7&labelColor=%23313244" alt="stars"></a>
<a href="https://github.com/zephardev/hyprcraft/forks"><img src="https://img.shields.io/github/forks/zephardev/hyprcraft?style=for-the-badge&logo=appveyor&color=%23F9E2AF&logoColor=%23F9E2AF&labelColor=%23313244" alt="forks"></a>
<a href="https://github.com/zephardev/hyprcraft/commits/main"><img src="https://img.shields.io/github/last-commit/zephardev/hyprcraft?style=for-the-badge&logo=github&color=%23EBA0AC&logoColor=%23EBA0AC&labelColor=%23313244" alt="last commit"></a>
<a href="https://github.com/zephardev/hyprcraft/blob/main/LICENSE"><img src="https://img.shields.io/github/license/zephardev/hyprcraft?style=for-the-badge&color=%23CBA6F7&labelColor=%23313244" alt="license"></a>
</p>
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/mocha.png" alt="Catppuccin Mocha palette" width="520"/>
</p>

---

## Table of Contents
1. [Project Overview](#project-overview)  
2. [Design & Colors](#design--colors)  
3. [Features](#features)  
4. [Architecture & Dotfiles Layout](#architecture--dotfiles-layout)  
5. [Installation (One-liner & Manual)](#installation-one-liner--manual)  
6. [Quick Start](#quick-start)  
7. [Customization & Theming](#customization--theming)  
8. [Screenshots & Demo](#screenshots--demo)  
9. [Development & Contributing](#development--contributing)  
10. [Roadmap](#roadmap)  
11. [Credits & License](#credits--license)

---

## Project Overview
HyprCraft is a production-grade Hyprland ricing and dotfiles collection built for consistency, speed and aesthetic coherence. It brings curated Hyprland configs, Waybar modules, Rofi themes, Kitty templates and utility scripts under a single opinionated layout. Designed for users who value minimalism and repeatable design.

---

## Design & Colors (Catppuccin Mocha)
Use these exact colors for all badges, assets and branding. Do not change.
- Background / base: `#1e1e2e`  
- Panel / label: `#313244`  
- Foreground / text: `#cdd6f4`  
- Accent palette: `#cba6f7`, `#f9e2af`, `#eba0ac`, `#89b4fa`  

Badges in this README use `labelColor=#313244` and primary `color` set to Catppuccin accents.

---

## Features
- Complete Hyprland config tuned for responsiveness and clarity.  
- Prebuilt modules: Waybar (status + system), Rofi (launcher + dmenu), swaync, nwg-dock support.  
- Kitty terminal themes and Alacritty fallback templates.  
- Dotfiles installer with idempotent script and safe backup.  
- Theme switcher script that toggles between Macchiato / Mocha palettes.  
- Opinionated keybindings with modular `bindings.conf` for quick remapping.  
- Static screenshot and live demo assets integrated for README previews.

---

## Architecture & Dotfiles Layout

~/.config/hyprcraft/ ├─ hypr/                 # hyprland main configs │  ├─ hyprland.conf │  ├─ monitors.conf │  └─ bindings.conf ├─ waybar/               # custom modules + styles │  ├─ config.json │  └─ style.css ├─ rofi/                 # rofi themes + scripts │  └─ hyprcraft.rasi ├─ kitty/                # terminal templates ├─ nwg-dock/ ├─ scripts/ │  ├─ install.sh │  ├─ theme-switch.sh │  └─ backup-dotfiles.sh └─ assets/ ├─ wallpaper.png └─ icons/

---

## Installation — One-liner
```bash
git clone https://github.com/zephardev/hyprcraft.git ~/.config/hyprcraft && cd ~/.config/hyprcraft && ./install.sh

Manual steps

git clone https://github.com/zephardev/hyprcraft.git ~/.config/hyprcraft
cd ~/.config/hyprcraft
./scripts/backup-dotfiles.sh   # safe backup existing config
./scripts/install.sh           # idempotent installer

install.sh will:

Validate Hyprland runtime

Deploy configs to ~/.config/*

Create backups at ~/.config/hyprcraft/backups/DATE/

Offer optional prompt to enable Waybar and nwg-dock services



---

Quick Start

1. Install Hyprland and dependencies (Waybar, Rofi, Kitty, nwg-dock).


2. Clone repository and run installer.


3. Log out and log back into Hyprland or restart Hyprland: hyprctl dispatch reload


4. Use theme-switch.sh to toggle palettes: ./scripts/theme-switch.sh mocha




---

Customization & Theming

Central theme variables live in assets/theme.conf. Edit only hex values.

theme-switch.sh updates Waybar, Rofi and Kitty templates atomically.

To add a new module for Waybar:

1. Add module.json to waybar/modules/


2. Reference it in waybar/config.json


3. Restart Waybar: pkill waybar && waybar &




Exact color tokens (copy/paste):

BACKGROUND=#1e1e2e
LABEL=#313244
FOREGROUND=#cdd6f4
ACCENT1=#cba6f7
ACCENT2=#f9e2af
ACCENT3=#eba0ac


---

Screenshots & Demo

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/sample.png" alt="preview" width="780"/>
</p>
For animated demo include `assets/demo.gif` exported at 30 FPS and 720p for README.
---

Development & Contributing

Contributions follow a strict rubric to preserve aesthetics and functionality.

Open issues for design or functional changes. Use templates.

Branch from feature/<short-desc>. PR must include:

Screenshots or GIFs for UI changes.

assets/palette/ updates if colors change.

Tests for scripts (install.sh --check).


CI enforces:

Shellcheck for scripts.

JSON lint for Waybar and rofi configs.

Prettier for CSS and Rasi files.



Add a new theme:

Add palette file to assets/palette/

Update scripts/theme-index.json with metadata.



---

Roadmap

[ ] Modular plugin system for Waybar widgets.

[ ] Declarative dotfile profiles (gaming / low-power / dev).

[ ] A theme generator that exports to Kitty, Waybar, Rofi and nwg-dock simultaneously.

[ ] Arch PKGBUILD for HyprCraft installer.


Priority: reproducibility, non-destructive installs, and strict adherence to Catppuccin palette.


---

Stack & Tools Used

Hyprland, Arch Linux, Wayland, Hypr, Waybar, Rofi, Kitty, nwg-dock, Bash, CSS, JSONC, Java (tools), C/C++, Neovim, Git, GitHub, Kitty.


---

Credits & License

Designed with Catppuccin palettes and artwork. Attribution and assets are used under their repository terms.
This repository is licensed under the MIT License. See LICENSE for full text.


---

Contact & Support

Issues: https://github.com/zephardev/hyprcraft/issues

Pull requests: open a PR to main with required checks.



---

<footer align="center">
<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" alt="Catppuccin footer"/>
</p>
</footer>
```