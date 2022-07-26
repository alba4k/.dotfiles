alias p=paru
alias Syu="sudo pacman -Syu"

alias c="clear && fish && exit"
alias C="reset && fish && exit"

alias ls="exa"
alias la="exa -a"
alias ll="exa -la"

alias hibernate="systemctl hibernate"
alias icat="kitty +kitten icat"

set fish_greeting
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR=/usr/bin/nvim

set tide_git_icon 

albafetch
#uptime-record -s

