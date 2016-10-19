#!/bin/sh

#set -euo pipefail

#xrdb -load ~/.Xresources

# Xrandr

xrandr --output eDP1 --preferred
xrandr --output DP1 --preferred

#dunst &

exec xmonad

