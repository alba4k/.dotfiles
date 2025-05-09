#!/bin/sh
# based on a script by vlk (https://github.com/REALERvolker1/pmgmt-sh)
set -eu

# device paths
UPOWER_AC_DEVICE='/org/freedesktop/UPower/devices/line_power_AC'
UPOWER_BAT_DEVICE='/org/freedesktop/UPower/devices/battery_BAT0'
SYSFS_AC_DEVICE='/sys/class/power_supply/AC/online'

prev=""

ac_command_center () {
    local ac_state="${1:-}"
   
    # avoid running on the first instance
    if [ "$prev" = "" ]; then
        prev="idk lol"
        return
    fi

    local perc=$(($(upower -i $UPOWER_BAT_DEVICE | grep percentage | awk "{print \$2}" | tr -d %)))

    if (( $perc == 100 )); then
        local icon='󰁹 󰁹'
    elif (( perc > 85 )); then
        local icon='󰂁 󰂁'
    elif (( perc > 75 )); then
        local icon='󰂀 󰂀'
    elif (( perc > 60 )); then
        local icon='󰁿 󰁿'
    elif (( perc > 45 )); then
        local icon='󰁽 󰁽'
    elif (( perc > 20 )); then
        local icon='󰁻 󰁻'
    else
        local icon='󰂎 󰂎'
    fi

    if [ "$ac_state" = 'true' ]; then
        icon=$(echo $icon | awk '{print $1}')
        notify-send -t 2000 -u low -i battery -r 69420 -a "Sistema" " In carica" " $icon Batteria al $perc%"
    elif [ "$ac_state" = 'false' ]; then
        icon=$(echo $icon | awk '{print $2}')
        notify-send -t 2000 -u low -i battery -r 69420 -a "Sistema" "󰚦 Carica fermata" " $icon Batteria al $perc%"
    fi
}

ac_monitor () {
    dbus-monitor --system "type='signal',sender='org.freedesktop.UPower',path='$UPOWER_AC_DEVICE',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged'" |& grep --line-buffered -oP 'boolean \K.*$' | while read -r line; do
        ac_command_center "$line"
    done
}

_instance_detect () {
    local program_name="${0##*/}"
    local program_id="$$"
    local pids
    pids="$(pidof -x "$program_name")"

    if [ "$(echo "$pids" | tr ' ' '\n' | wc -l)" -gt 1 ]; then
        for i in $pids; do
            [ "$i" = "$program_id" ] && continue
            kill "$i" && printf "%s is already running. Killed %s\n" "$program_name" "$i"
        done
    fi
}

_instance_detect

case "$(cat "$SYSFS_AC_DEVICE")" in
    1)
        ac_command_center 'true'
    ;; 0)
        ac_command_center 'false'
    ;; *)
        echo "ERROR: Failed to get current AC state"
        exit 1
    ;;
esac

ac_monitor
