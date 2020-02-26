#!/bin/bash
#
# ~/.profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.ghcup/env ]] && . ~/.ghcup/env

export PATH=$PATH:$HOME/.scripts:$HOME/.local/bin:$HOME/.emacs.d/bin
export SHELL="bash"
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -c -a emacs"
export BROWSER="dissenter-browser"

if # Test if the kernel is WSL
	read var </proc/sys/kernel/osrelease
	[[ "$var" =~ "Microsoft" ]]
then
	export DISPLAY=:0.0
else # Kernel is native Linux
	# TODO Does this work properly on Arch?
	if [[ ! -f /usr/share/terminfo/s/screen.rxvt ]]; then
		export TERM="urxvtc"
	fi

	if [[ $(tty) = /dev/tty1 ]]; then
		startx
	fi
fi
