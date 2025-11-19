# ▪files

This repo contains my personal configuration files — also known as **dotfiles** — managed using [GNU Stow](https://www.gnu.org/software/stow/).

## ⚙️ Setup

Clone it to **🏠** and **stow** all the files:

```bash
cd ~
git clone https://github.com/drmendel/dotfiles.git .files   # Keep dotfiles hidden
cd ~/.files
stow .
```

---

## 📂 Contents

```bash
.files/
├── .bashrc
├── .config
│   ├── alacritty/
│   │   ├── alacritty.toml
│   │   └── themes/
│   ├── background -> ./wallpapers/void.png
│   ├── nvim/
│   │   ├── init.lua
│   │   └── lua/
│   ├── picom/
│   │   └── picom.conf
│   ├── starship/
│   │   └── starship.toml
│   └── wallpapers/
│       ├── arch_xorg.png
│       └── void.png
├── .stow-local-ignore
├── .xinitrc
├── .zshrc
└── README.md
```