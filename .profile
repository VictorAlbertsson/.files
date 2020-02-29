#!/bin/bash
# ~/.profile

# shellcheck disable=SC1090
[[ -f ~/.bashrc ]] && source "$HOME/.bashrc"
[[ -f ~/.ghcup/env ]] && source "$HOME/.ghcup/env"
[[ -f ~/.cargo/env ]] && source "$HOME/.cargo/env"

export PATH=$PATH:$HOME/.scripts:$HOME/.local/bin:$HOME/.emacs.d/bin
export SHELL="bash"
export EDITOR="emacs -nw"
export VISUAL="emacs"
export BROWSER="brave"

if # Test if the kernel is WSL
	read -r system_type </proc/sys/kernel/osrelease
	[[ "$system_type" =~ "Microsoft" ]]
then
	export DISPLAY=:0.0
else # Kernel is native Linux
	# TODO Does this work properly on Arch?
	if [[ ! -f /usr/share/terminfo/s/screen.rxvt ]]; then
		export TERM="alacritty"
	fi

	if [[ $(tty) = /dev/tty1 ]]; then
		startx
	fi
fi
