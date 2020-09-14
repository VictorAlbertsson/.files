#!/usr/bin/env bash
# use Swedish keyboard with compose key and APL extensions
setxkbmap se,apl \
	  -option grp:menu_switch \
	  -option lv3:ralt_switch \
	  -option compose:caps \
	  -variant ,dyalog

# Stop the X cursor from appearing on unclickable areas
xsetroot -cursor_name left_ptr

# Set wallpaper
xwallpaper --center ~/.wallpapers/pacwall.png

# Transparency
xcompmgr -c &

# Start Emacs
emacs --daemon &

# Note that in order for XMonad to work properly the following directories must exist:
## $XDG_DATA_HOME/xmonad
## $XDG_CACHE_HOME/xmonad
## $XDG_CONFIG_HOME/xmonad
exec xmonad
