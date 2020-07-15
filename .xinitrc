#!/usr/bin/env bash
# Scripts
setxkbmap se # Set language to swedish
xsetroot -cursor_name left_ptr # Stop the X cursor from appearing on unclickable areas
xwallpaper --center ~/.wallpapers/pacwall.png # Set wallpaper
xcompmgr -c & # Transparency
emacs --daemon

# Note that in order for XMonad to work properly the following directories must exist:
## $XDG_DATA_HOME/xmonad
## $XDG_CACHE_HOME/xmonad
## $XDG_CONFIG_HOME/xmonad
exec xmonad
