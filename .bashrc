#!env bash
# shellcheck disable=SC2155
#  ____    _    ____  _   _ ____   ____
# | __ )  / \  / ___|| | | |  _ \ / ___|
# |  _ \ / _ \ \___ \| |_| | |_) | |
# | |_) / ___ \ ___) |  _  |  _ <| |___
# |____/_/   \_\____/|_| |_|_| \_\\____|
#
# ~/.bashrc
#

stty -ixon # Disable C-s and C-q
# shopt -s autocd

# Bash initialization for interactive non-login shells and
# for remote shells (info "(bash) Bash Startup Files").

# Export 'SHELL' to child processes.  Programs such as 'screen'
# honor it and otherwise use /bin/sh.
export SHELL

# If this is an SSH session (as in "ssh host command"), source
# /etc/profile so we get PATH and other essential variables.
[[ $- != *i* ]] && [[ -n "$SSH_CLIENT" ]] && source /etc/profile

# Source the system-wide file.
source /etc/bashrc

# Adjust the prompt depending on whether we're in 'guix environment'.
# NOTE `tput' requires `ncurses' to be installed
if [ -n "$GUIX_ENVIRONMENT" ]
then
    PS1="\[\033[38;5;9m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\] [env]\n\\$ \[$(tput sgr0)\]"
else
    PS1="\[\033[38;5;9m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\n\\$ \[$(tput sgr0)\]"
fi

export HISTSIZE=""
export HISTFILESIZE="" # Infinite history.

# Sane defaults
alias ls="ls -lhpN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias mv="mv -i"
alias rm="rm -i"
alias sbcl="rlwrap sbcl"

# Personal scripts
alias wttr="curl wttr.in/vebomark?pq"
alias config='git --git-dir=$HOME/.files --work-tree=$HOME'
alias edit="slurp emacsclient --create-frame"
alias dyalog="sudo docker run -it dyalog/dyalog"
