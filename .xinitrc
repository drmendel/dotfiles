#!/bin/sh


# Start dbus session

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi


# Merge user X resources

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Load X profile

[ -f ~/.xprofile ] && . ~/.xprofile

# Sound

pipewire &

# Keyboard layout

setxkbmap hu

# Monitor layout

autorandr -c # --change

# Background apps

picom -f --config ~/.config/picom/picom.conf &      # Compositor: transparency, animations
feh --bg-fill ~/.config/background                 # Wallpaper
dwmblocks &                                         # Statusbar


# Start window manager

exec dwm
