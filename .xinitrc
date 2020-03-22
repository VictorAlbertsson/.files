# Scripts
setxkbmap se
feh --no-fehbg --bg-scale --randomize --recursive "$HOME/.wallpapers/"

# Daemons
xcompmgr -c &

exec ssh-agent xmonad
