#
# ~/.bashrc
#

export PATH="/home/alba4k/.local/bin:/usr/lib/ccache/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ "$(tty)" == "/dev/tty1" ]]; then
    # exec start-hyprland >/dev/null 2>&1
    exec hyprland >/dev/null 2>&1
fi

fish
exit

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

