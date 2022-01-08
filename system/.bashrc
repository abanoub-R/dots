#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
export PS1="\[\033[38;5;27m\]\u@\h\[$(tput sgr0)\] (\w) \[$(tput sgr0)\]\[\033[38;5;27m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
alias wc='cd ~/Documents/src/c'
alias wcpp='cd ~/Documents/src/c++'
alias wcs='cd ~/Documents/src/c#'
alias wsh='cd ~/Documents/src/sh'
