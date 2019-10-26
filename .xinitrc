setxkbmap se &
xcompmgr -c &
xrdb -load $HOME/.Xresources -quiet &
xset b off &
xsetroot -cursor_name left_ptr &
urxvtd -q -f -o &
sxhkd -c $HOME/.sxhkdrc &

# Should these really be here?
syncthing --no-browser &

feh --no-fehbg --bg-scale --randomize --recursive $HOME/.wallpapers/*
exec ssh-agent bspwm -c $HOME/.bspwmrc
