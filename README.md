<h1 align="center" style="color:#cba6f7; margin-bottom:0.2em;">
  ZepharDev: 🍂 HyprCraft — Minimalism meets Functionality
</h1>

<p align="center">
  <a href="https://github.com/ZepharDev/HyprCraft/stargazers">
    <img src="https://img.shields.io/github/stars/ZepharDev/HyprCraft?color=cba6f7&style=for-the-badge&label=Stars&labelColor=1e1e2e&logo=starship&logoColor=white">
  </a>
  <a href="https://github.com/ZepharDev/HyprCraft/network/members">
    <img src="https://img.shields.io/github/forks/ZepharDev/HyprCraft?color=cba6f7&style=for-the-badge&label=Forks&labelColor=1e1e2e&logo=sourcetree&logoColor=white">
  </a>
  <a href="https://github.com/ZepharDev/HyprCraft/commits">
    <img src="https://img.shields.io/github/commit-activity/y/ZepharDev/HyprCraft?color=eba0ac&style=for-the-badge&label=Commits&labelColor=1e1e2e&logo=git&logoColor=white">
  </a>
  <a href="https://github.com/ZepharDev/HyprCraft/commits">
    <img src="https://img.shields.io/github/last-commit/ZepharDev/HyprCraft?color=f9e2af&style=for-the-badge&label=Last%20Commit&labelColor=1e1e2e&logo=clockify&logoColor=white">
  </a>
</p>

---

<h2 align="center">⚙️ HyprCraft — A Curated Hyprland Setup</h2>

<p align="center">HyprCraft is a handcrafted setup focused on simplicity, coherence, and functionality — all running on <strong>Wayland + Hyprland</strong>.</p>

<div align="center">
  <img src="Assets/main-preview.png" alt="Main Preview" width="100%" />
</div>

---

<h2 align="center">📦 Core Features</h2>

<ul>
  <li>🔹 Full Hyprland configuration (dynamic layouts, animations, keybinds)</li>
  <li>🔹 Custom Waybar with modules, theming, and widgets</li>
  <li>🔹 Rofi launcher + powermenu + themes</li>
  <li>🔹 Kitty with Zsh and full terminal workflow</li>
  <li>🔹 Neovim IDE-style config</li>
  <li>🔹 SwayOSD, SwayNC, Hyprlock, Hyprpaper, Hyprshot</li>
  <li>🔹 Player controls, volume OSD, cava, btop, and more</li>
</ul>

---

<h2 align="center">🚀 Quick Installation</h2>

> ⚠️ **Warning**: This script will move your existing configs to `~/.config_backup` and replace them. Use responsibly.

```bash
git clone https://github.com/ZepharDev/HyprCraft ~/HyprCraft
cd ~/HyprCraft
bash setup.sh
```

<p align="center"><strong>Manual selection is recommended</strong>. Avoid "full setup" unless you know what you're doing.</p>

---

<h2 align="center">🧩 Requirements</h2>

<h3>🗝️ Core Environment</h3>

- <a href="https://hyprland.org">Hyprland</a>
- <a href="https://github.com/Alexays/Waybar">Waybar</a>
- <a href="https://github.com/lbonn/rofi">Rofi (Wayland)</a>
- <a href="https://sw.kovidgoyal.net/kitty/">Kitty Terminal</a>
- <a href="https://www.zsh.org">Zsh</a>

<h3>📦 System & Widgets</h3>

- <a href="https://github.com/ErikReider/SwayOSD">SwayOSD</a>
- <a href="https://github.com/ErikReider/SwayNotificationCenter">SwayNC</a>
- <a href="https://github.com/hyprwm/Hyprlock">Hyprlock</a>
- <a href="https://github.com/hyprwm/hypridle">Hypridle</a>
- <a href="https://github.com/hyprwm/hyprpaper">Hyprpaper</a>
- <a href="https://github.com/HyprWM/hyprshot">Hyprshot</a>
- <a href="https://github.com/ArtsyMacaw/wlogout">wlogout</a>

<h3>🛠️ Utilities</h3>

- <a href="https://github.com/aristocratos/btop">btop</a>
- <a href="https://github.com/karlstav/cava">cava</a>
- <a href="https://github.com/fastfetch-cli/fastfetch">Fastfetch</a>
- <a href="https://neovim.io/">Neovim</a>
- <a href="https://tools.suckless.org/dmenu/">Dmenu</a>
- <a href="https://github.com/Jguer/yay">Yay</a>
- <a href="https://pipewire.org">Pipewire</a>
- <a href="https://wiki.archlinux.org/title/NetworkManager">NetworkManager</a>
- <a href="https://github.com/dunst-project/dunst">Dunst</a>

---

<h2 align="center">🖼️ Previews</h2>

<div align="center">
  <img src="Assets/rofi-launcher.png" alt="Launcher" width="49%">
  <img src="Assets/powermenu.png" alt="Powermenu" width="49%">
</div>

<div align="center">
  <img src="Assets/git-tui.png" alt="Git FZF" width="49%">
  <img src="Assets/wallpicker.png" alt="Wallpaper Picker" width="49%">
</div>

<div align="center">
  <img src="Assets/nvim.png" alt="Neovim" width="100%">
</div>

<div align="center">
  <img src="Assets/btop.png" alt="btop" width="100%">
</div>

<div align="center">
  <img src="Assets/obs-cava.png" alt="Cava" width="100%">
</div>

---

<h2 align="center">🎨 Wallpapers</h2>

<p align="center">
  Wallpapers used in the setup are available here:  
  <a href="https://drive.google.com/drive/folders/1Eog40yvrTshjDLVIETVncBKcDsvPLMIX?usp=sharing">
    📁 Google Drive Wallpapers
  </a>
</p>

---

<h2 align="center">📢 Disclaimer & Notice</h2>

<p><strong>⚠️ This setup is crafted for personal use.</strong> Please do not run any scripts without reviewing their content.</p>

<ul>
  <li>The uninstall and rescue features are under development.</li>
  <li>If you experience bugs, open an issue or contact me.</li>
  <li>Use manual install for better control over components.</li>
</ul>

---

<h2 align="center">🔖 Credits & Inspirations</h2>

<ul>
  <li>Catppuccin for the theme and palette</li>
  <li>Hyprland community for WM innovations</li>
  <li>Ricers and devs sharing their configs & tools</li>
</ul>

---

<div align="center">
  <img src="https://img.shields.io/badge/Built_with-Hyprland-cba6f7?style=for-the-badge&logo=hyprland&logoColor=white&labelColor=1e1e2e" />
  <img src="https://img.shields.io/badge/Powered_by-Arch_Linux-f5c2e7?style=for-the-badge&logo=arch-linux&logoColor=white&labelColor=1e1e2e" />
  <img src="https://img.shields.io/badge/Crafted_by-ZepharDev-f9e2af?style=for-the-badge&logo=github&logoColor=white&labelColor=1e1e2e" />
</div>

<br/>

<div align="center">
  <img src="https://img.shields.io/badge/✝%20Christ_First-eba0ac?style=for-the-badge&labelColor=1e1e2e&logoColor=white" />
  <img src="https://img.shields.io/badge/✟%20Soli_Deo_Gloria-cba6f7?style=for-the-badge&labelColor=1e1e2e&logoColor=white" />
  <img src="https://img.shields.io/badge/☧%20Faith-f5c2e7?style=for-the-badge&labelColor=1e1e2e&logoColor=white" />
</div>

<p align="center"><sub>All for Christ. All by grace. Code in reverence — YHWH reigns.</sub></p>

