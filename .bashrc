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
alias ls="ls -hN --color=auto --group-directories-first"
alias lsa="ls -la -hN --color=auto --group-directories-first"

# Extra
alias wttr='curl wttr.in/Vebomark'
alias config='/usr/bin/git --git-dir=/home/victor/dotfiles --work-tree=/home/victor'

# Terminal stuff
PS1='[\u@\h \W]\$ '
