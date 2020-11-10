#!/usr/bin/env bash
# ~/.profile

# shellcheck disable=SC1090
[[ -f ~/.bashrc ]] && source "$HOME/.bashrc"
[[ -f ~/.ghcup/env ]] && source "$HOME/.ghcup/env"
[[ -f ~/.cargo/env ]] && source "$HOME/.cargo/env"

export PATH="$PATH:$HOME/.local/bin:$HOME/.scripts"
export SHELL="bash"
export ALTERNATE_EDITOR="" # Substitutes the -a '' flag for the emacs client
export EDITOR="emacsclient --tty"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
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
		export VISUAL="emacsclient --create-frame"
		export BROWSER="min"
		export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This might break: xauth, file doesn't exist /run/user/1000/Xauthority
		export LESSHISTFILE="-" # Make less ignore history
		export WGETRC="$XDG_DATA_HOME/wget/wgetrc"
		export GNUPGHOME="$XDG_DATA_HOME/gnupg"
		export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
		export ALSA_CONFIG_PATH="$XDG_DATA_HOME/alsa/asoundrc"
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
