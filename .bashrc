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
export HISTSIZE=''
export HISTFILESIZE='' # Infinite history.

# Sane defaults
alias ls="ls -lhN --color=auto --group-directories-first"
alias mv="mv -i"
alias rm="rm -i"

# Extra
alias wttr='curl wttr.in/vebomark'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

# Terminal stuff
PS1='[\u@\h \W]\$ '
