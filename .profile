#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.scripts
export TERM="urxvtc"
export SHELL="bash"
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"
export BROWSER="dissenter-browser"

if [[ $(tty) = /dev/tty1 ]]; then
	startx
fi
