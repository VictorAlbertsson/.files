#
# ~/.profile
#

[[ -f ~/.bashrc    ]] && . ~/.bashrc
[[ -f ~/.ghcup/env ]] && . ~/.ghcup/env

export PATH=$PATH:$HOME/.scripts:$HOME/.local/bin:$HOME/bin:$HOME/.emacs.d/bin
export TERM="urxvtc"
export SHELL="bash"
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -c -a emacs"
export BROWSER="dissenter-browser"

if [[ $(tty) = /dev/tty1 ]]; then
    startx
fi
