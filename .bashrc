# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1="\[\033[38;5;22m\]\h\[$(tput sgr0)\]\[\033[38;5;241m\]:\[$(tput sgr0)\]\[\033[38;5;28m\][\[$(tput sgr0)\]\[\033[38;5;34m\]\u\[$(tput sgr0)\]\[\033[38;5;28m\]]\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;241m\]:\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;241m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;22m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
