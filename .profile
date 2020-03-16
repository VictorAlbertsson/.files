#!/bin/bash
# ~/.profile

# shellcheck disable=SC1090
[[ -f ~/.bashrc ]] && source "$HOME/.bashrc"
[[ -f ~/.ghcup/env ]] && source "$HOME/.ghcup/env"
[[ -f ~/.cargo/env ]] && source "$HOME/.cargo/env"

export PATH=$PATH:$HOME/.scripts:$HOME/.emacs.d/bin
export SHELL="bash"
export EDITOR="emacs -nw"

# Test whether the kernel is native or running through WSL
if
	read -r system_kernel </proc/sys/kernel/osrelease
	[[ "$system_kernel" =~ "Microsoft" ]]
then # WSL
	export DISPLAY=:0.0
else # Native
	if [[ -f /usr/share/terminfo/s/screen.xterm-256color ]]; then
		export TERM="alacritty"
		export VISUAL="emacs"
		export BROWSER="brave"
	fi

	# Ensure that one and only one ssh-agent is running
	if ! pgrep -u "$USER" ssh-agent >/dev/null; then
		ssh-agent >"$XDG_RUNTIME_DIR/ssh-agent.env"
	fi

	# Set the necessary SSH environment variables
	if [[ ! "$SSH_AUTH_SOCK" ]]; then
		eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
	fi


	if [[ $(tty) = /dev/tty1 ]]; then
		startx
	fi
fi
