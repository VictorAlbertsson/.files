#!/usr/bin/env bash
# use Swedish keyboard and APL extensions
setxkbmap se,apl \
	  -option grp:caps_switch \
	  -option lv3:ralt_switch \
	  -variant ,dyalog
# Stop the X cursor from appearing on unclickable areas
xsetroot -cursor_name left_ptr

# Set wallpaper
xwallpaper --center ~/.wallpapers/arch-linux-logo-win10-style.png

# Transparency
xcompmgr -c &

# Start Emacs
emacs --daemon &

# Note that in order for XMonad to work properly the following directories must exist
## $XDG_DATA_HOME/xmonad
## $XDG_CACHE_HOME/xmonad
## $XDG_CONFIG_HOME/xmonad
# and ~/.xmonad can't exist
exec xmonad
