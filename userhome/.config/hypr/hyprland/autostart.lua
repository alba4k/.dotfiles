--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hyprland.org
--
-- ##############################################
-- ###               AUTOSTART                ###
-- ##############################################

hl.on("hyprland.start", function ()
    hl.exec_cmd("bitwarden")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("hypr-network-manager --daemon")
    hl.exec_cmd("hyprctl devices | grep logitech && solaar -w hide -b solaar")
    hl.exec_cmd("hypridle --quiet")
    hl.exec_cmd("hyprlock -c ~/.config/hypr/hyprlock/hyprlogin.conf || hyprctl dispatch exit") -- Login Manager
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("i3-battery-popup -n -D -L 20 -m 'Battery is getting low!' -t 3m -s ~/.config/hypr/assets/click.ogg -v 50")
    hl.exec_cmd("kdeconnect-indicator")
    hl.exec_cmd("lxpolkit")
    hl.exec_cmd("swaync")
    hl.exec_cmd("waybar")
    hl.exec_cmd("shikane")

    -- Scripts
    hl.exec_cmd("~/.config/hypr/scripts/ac_detect.sh")
    hl.exec_cmd("~/.config/hypr/scripts/capslock.sh")
    hl.exec_cmd("~/.config/hypr/scripts/volbright.sh --brightness --keyboard --volume")

    -- Clipboard
    hl.exec_cmd("cliphist wipe")
    hl.exec_cmd("wl-clip-persist -c both")
    hl.exec_cmd("wl-paste --watch cliphist store")
end)

hl.exec_cmd("swaync-client -R")
hl.exec_cmd("swaync-client -rs")

hl.exec_cmd("killall -SIGUSR2 waybar")
