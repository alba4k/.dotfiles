#
# ~/.profile
#

export PATH="$PATH:/home/alba4k/.local/bin"

#export QT_QPA_PLATFORMTHEME="qt5ct"
#export QT_QPA_PLATFORM="wayland"
#export GTK_THEME="Catppuccin-purple"

# export LIBVA_DRIVER_NAME="iHD"

# export GTK_USE_PORTAL=0

# export XCURSOR_SIZE=16

#export MAKEFLAGS="-j14"

#export MANPAGER="bat -pl man"

#export XDG_CONFIG_HOME="/home/alba4k/.config"
#export XDG_CACHE_HOME="/home/alba4k/.cache"
#export XDG_DATA_HOME="/home/alba4k/.local/share"

#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Added by Toolbox App
#export PATH="$PATH:/home/alba4k/.local/share/JetBrains/Toolbox/scripts"

if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec Hyprland >/dev/null 2>&1
fi

