# Scripts
setxkbmap se
xrdb -load $HOME/.Xresources -quiet
xset s off
xset b off
xsetroot -cursor_name left_ptr
feh --no-fehbg --bg-scale --randomize --recursive $HOME/.wallpapers/*

# Daemons
xcompmgr -c &
urxvtd -q -f -o &

exec ssh-agent /usr/local/bin/stumpwm
