if status --is-interactive
    uptime-record -s &
    albafetch
end

alias p="paru" &
alias g="git" &

alias yeet_the_orphans="sudo pacman -Rssn (pacman -Qdtq) 2>/dev/null || echo No orphan packages were found!" &
alias fwupd="fwupdmgr refresh; fwupdmgr get-updates && sudo fwupdmgr install" &
alias sudo="sudo -p 'Impronta digitale o password: "\n"'" &

alias c="tput reset && fish && exit" &
alias :q="exit" &
alias :wq="exit" &
alias :Wq="exit" & # 'cause I like misstyping

alias l="eza --group-directories-first --icons --color=always" &
alias ls="eza --group-directories-first --icons --color=always" &
alias la="eza -a --group-directories-first --icons --color=always" &
alias ll="eza -la --group-directories-first --icons --git --color=always" &

alias rm="rmtrash" &
alias rmf="/usr/bin/rm" &

alias white="python -c \"import tkinter as tk; tk.Tk().config(bg='#FFFFFF');tk.mainloop()\"" &
alias black="python -c \"import tkinter as tk; tk.Tk().config(bg='#000000');tk.mainloop()\"" &

alias reboot="systemctl reboot" & # so I can uise --firmware-setup
alias hibernate="systemctl hibernate" &
if [ "$TERM" = "xterm-kitty" ]
    alias icat="kitten icat" &
    alias ssh="kitten ssh" &
end

alias smallfetch="albafetch --config /home/alba4k/.config/albafetch/albafetch_small.conf" &

set fish_greeting &

set tide_git_icon  &

#alias sudo=doas
#alias sudoedit="doas nvim"

# Calculator with 1 + 1 like in powershell
alias m="math" &
alias 1="math 1" &
alias 2="math 2" &
alias 3="math 3" &
alias 4="math 4" &
alias 5="math 5" &
alias 6="math 6" &
alias 7="math 7" &
alias 8="math 8" &
alias 9="math 9" &
alias 0="math 0" &

zoxide init --cmd cd fish | source

#thefuck --alias | source
