#!/bin/sh


# Start dbus session

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi


# Merge user X resources

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources


# Sound

pipewire &
pipewire-pulse &
wireplumber &


# Keyboard layout

setxkbmap hu


# Background apps

picom -f --config ~/.config/picom/picom.conf &      # Compositor: transparency, animations
feh --bg-scale ~/.config/background                 # Wallpaper
dwmblocks &                                         # Statusbar


# Start window manager

exec dwm