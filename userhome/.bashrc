#
# ~/.bashrc
#

export PATH="$PATH:/home/alba4k/.local/bin"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec Hyprland >/dev/null 2>&1
fi

fish
exit

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

