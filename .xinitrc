setxkbmap se &
xcompmgr -c &
xrdb -load $HOME/.Xresources -quiet &
xset b off &
xsetroot -cursor_name left_ptr &
sxhkd -c $HOME/.sxhkdrc &
urxvtd -q -f -o &
emacs --daemon &

# Should these really be here?
pulseaudio --start &
syncthing --no-browser &

feh --no-fehbg --bg-scale --randomize --recursive $HOME/.wallpapers/*
exec ssh-agent bspwm -c $HOME/.bspwmrc
