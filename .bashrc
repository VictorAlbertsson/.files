#  ____    _    ____  _   _ ____   ____ 
# | __ )  / \  / ___|| | | |  _ \ / ___|
# |  _ \ / _ \ \___ \| |_| | |_) | |    
# | |_) / ___ \ ___) |  _  |  _ <| |___ 
# |____/_/   \_\____/|_| |_|_| \_\\____|
#
# ~/.bashrc
#

stty -ixon # Disable C-s and C-q
shopt -s autocd # Allow autocd
HISTSIZE= HISTFILESIZE= # Infinite history.

# Sane defaults
alias ls="ls -lhN --color=auto --group-directories-first"

# Extra
alias wttr='curl wttr.in/vebomark'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias e="$EDITOR"

# Terminal stuff
PS1='[\u@\h \W]\$ '
