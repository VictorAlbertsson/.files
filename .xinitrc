# Scripts
setxkbmap se
xrdb -merge "$HOME/.Xresources" -quiet
feh --no-fehbg --bg-scale --randomize --recursive "$HOME/.wallpapers/"

# Daemons
xcompmgr -c &

exec ssh-agent xmonad
