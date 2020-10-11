#!/usr/bin/env bash
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
export HISTSIZE=""
export HISTFILESIZE="" # Infinite history.
export PS1="\[\033[38;5;9m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\n\\$ \[$(tput sgr0)\]"

# Sane defaults
alias ls="ls -lhN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias mv="mv -i"
alias rm="rm -i"
alias sbcl="rlwrap sbcl"

# Personal scripts
alias wttr="curl wttr.in/vebomark?pq"
alias config='/usr/bin/git --git-dir=$HOME/.files --work-tree=$HOME'
alias edit="slurp emacsclient --create-frame"
alias dyalog="sudo docker run -it dyalog/dyalog"
