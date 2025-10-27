#!/bin/sh
# ~/.xinitrc

# Merge user X resources
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Keyboard Layout
setxkbmap hu

# Background apps
picom -f --config ~/.config/picom/picom.conf & # Compositor: transparency, animatinos
feh --bg-scale ~/.config/background            # Wallpaper
dwmblocks &                                    # Statusbar

# Start window manager
exec dwm
