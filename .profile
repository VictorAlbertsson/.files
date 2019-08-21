#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.scripts
export TERM="urxvt"
export EDITOR="emacsclient -c -a ''"
export SHELL="/usr/bin/bash"

if [[ $(tty) = /dev/tty1 ]]; then
	startx
fi
