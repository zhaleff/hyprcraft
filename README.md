🖥️ My Dotfiles: Minimal & Coherent Hyprland Setup

Welcome to my personal dotfiles repository! This setup focuses on a clean, efficient Hyprland environment with minimal configurations for productivity and aesthetics. It's tailored for Arch Linux but adaptable. Star the repo ⭐ to stay updated with improvements.
These configs are a work in progress—feel free to fork, contribute, or suggest changes!
🛠️ Requirements

🔑 Core Environment

Hyprland: Tiling window manager hyprland.org
Waybar: Customizable status bar GitHub
Rofi (Wayland): App launcher and menu GitHub
Kitty: GPU-accelerated terminal sw.kovidgoyal.net/kitty
Zsh: Interactive shell www.zsh.org


📊 System & Widgets

SwayOSD: On-screen display for inputs GitHub
SwayNC: Notification center GitHub
Hyprlock: Screen locker GitHub
Hypridle: Idle management GitHub
Hyprpaper: Wallpaper daemon GitHub
Hyprshot: Screenshot tool GitHub (Alternative: grim + slurp)
Wlogout: Logout menu GitHub


🔧 Utilities & Tools

Btop: Resource monitor GitHub
FastFetch: System info fetcher GitHub
Cava: Audio visualizer GitHub
Clipse: Clipboard manager GitHub
Yay: AUR helper GitHub
Dmenu: Dynamic menu tools.suckless.org/dmenu
Neovim: Text editor neovim.io
Pipewire: Audio server pipewire.org
NetworkManager: Network management wiki.archlinux.org/title/NetworkManager
Nm-applet: Network tray applet wiki.archlinux.org/title/NetworkManager#nm-applet
Dunst: Notification daemon GitHub
Playerctl: Media controls GitHub
Brightnessctl: Brightness control GitHub
Pamixer: Audio mixer GitHub
Acpi: Power management wiki.archlinux.org/title/acpi
Hyprpicker: Color picker GitHub

📥 Installation

This repository includes an automated setup script with options for easy installation. However, review the script before running to understand what it does—it backs up your existing configs and installs new ones.
⚠️ Important Warning


The script moves your current ~/.config files (e.g., for Hyprland, Waybar, Kitty) to ~/.config_backup.
It installs fonts and themes to ~/.local/share/fonts.
Do not run if you have critical customizations without backing them up first.
The script is in development; test on a fresh install if possible. Options like "uninstall" may not be fully functional yet.
For issues, open a GitHub issue or contact via email.
This setup assumes Arch Linux with Hyprland installed.

Automatic Installation


Clone the repository to your home directory:
git clone https://github.com/yourusername/your-dotfiles-repo.git ~/dotfiles


Navigate to the directory:
cd ~/dotfiles


Run the setup script:
bash setup.sh


Choose "full setup" for everything or "manual selection" to pick components (e.g., Waybar, Neovim).
GTK themes (like Catppuccin) can be set via tools like nwg-look.



Manual Installation

If you prefer manual setup:

Install dependencies via your package manager (e.g., pacman on Arch).
Copy configs from this repo to ~/.config/ (backup first!).
Install fonts from the fonts/ directory to ~/.local/share/fonts and run fc-cache -fv.
Reload Hyprland with hyprctl reload.

🖼️ Screenshots

🐛 Issues & Contributions

If you encounter bugs, check the script logs or open an issue on GitHub. Contributions are welcome—fork and submit a PR!
For now, the setup script may have minor issues; manual installation is recommended for advanced users.


  
    
    
    
  
