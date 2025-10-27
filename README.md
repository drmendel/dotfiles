# ▪files

This repo contains my personal configuration files — also known as **dotfiles** — managed using [GNU Stow](https://www.gnu.org/software/stow/).

## ⚙️ Setup

Clone it to 🏠 and stow all files:

```bash
cd ~
git clone https://github.com/drmendel/dotfiles.git
cd ~/dotfiles
stow .
```

---

## 📂 Content

```bash
dotfiles/
├── .bashrc
├── .config
│   ├── alacritty
│   │   ├── alacritty.toml
│   │   └── themes
│   ├── picom
│   │   └── picom.conf
│   ├── starship.toml
│   └── zathura
│       └── zathurarc
├── .stow-local-ignore
├── .xinitrc
├── .zshrc
└── README.md
```
