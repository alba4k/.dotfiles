#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$PATH:/home/alba4k/.local/bin"

if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec Hyprland >/dev/null 2>&1
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
