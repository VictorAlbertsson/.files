#!/bin/bash
# ~/.profile

# shellcheck disable=SC1090
[[ -f ~/.bashrc ]] && source "$HOME/.bashrc"
[[ -f ~/.ghcup/env ]] && source "$HOME/.ghcup/env"
[[ -f ~/.cargo/env ]] && source "$HOME/.cargo/env"

export PATH=$PATH:$HOME/.scripts:$HOME/.emacs.d/bin:$HOME/.roswell/bin
export SHELL="bash"
export EDITOR="emacs -nw"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

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
		# Spring cleaning your Home!
		export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This might break: xauth, file doesn't exist /run/user/1000/Xauthority
		export LESSHISTFILE="-"
		export WGETRC="$HOME/.config/wget/wgetrc"
		export GNUPGHOME="$XDG_DATA_HOME/gnupg"
		export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
		export ALSA_CONFIG_PATH="$HOME/.config/alsa/asoundrc"
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
