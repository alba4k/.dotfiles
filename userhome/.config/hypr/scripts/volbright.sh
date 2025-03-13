#!/usr/bin/bash
# based on a script by vlk (https://github.com/REALERvolker1/volbright)
set -eu

BACKLIGHT_PATH="${BACKLIGHT_PATH:-/sys/class/backlight/intel_backlight}"
KEYBOARD_PATH="${KEYBOARD_PATH:-/sys/class/leds/dell::kbd_backlight}"

BRIGHTNESS_COLOR='#ffffff'
KEYBOARD_COLOR='#99c1f1'
VOLUME_COLOR='#8ff0a4'

#GOOD_COLOR='#57e389'
WARN_COLOR='#f8e45c'
URGENT_COLOR='#ff7800'
CRITICAL_COLOR='#ed333b'

APPNAME="Sistema"
BIN_NAME="${0##*/}"

_notify () {
    local icon="${1:?Error: Operation not specified}"
    local value="${2// }"
    local color="${3:-#FFFFFF}"

    if ((value >= 90)); then
        color="$CRITICAL_COLOR"
    elif ((value >= 80)); then
        color="$URGENT_COLOR"
    elif ((value >= 70)); then
        color="$WARN_COLOR"
    #elif (($value >= 60)); then
        #color="$GOOD_COLOR"
    fi

    notify-send -r 2593 -t 1000 -a "$APPNAME" -i $dunst_icon -u low -h "int:value:$value" -h "string:hlcolor:$color" -- "${icon} ${value}%"
}

_instance_detect () {
    local others="$(pidof -x "$BIN_NAME")"
    if [[ "$(echo "$others" | tr ' ' '\n' | wc -l)" -gt 1 ]]; then
        echo "Found multiple instances! Replacing all..."
        for i in $others; do
            [[ "$i" == "$$" ]] && echo "skipping self: $i" && continue
            kill "$i" && echo "killed process $i"
        done
    fi
}

monitor_brightness () {
    [ ! -d "$BACKLIGHT_PATH" ] && echo "ERROR! backlight path '$BACKLIGHT_PATH' does not exist!" && print_help
    local max_brightness
    local perc
    local brightness
    local icon
    local dunst_icon="brightnesssettings"

    local BRIGHT_PATH="$BACKLIGHT_PATH/brightness"

    max_brightness="$(cat "$BACKLIGHT_PATH/max_brightness")"
    perc=$((max_brightness / 100))

    while :; do
        inotifywait -qe 'OPEN' "$BRIGHT_PATH" > /dev/null
        brightness="$(cat "$BRIGHT_PATH")"
        brightness=$((brightness / perc))

        if ((brightness > 100)); then
            icon=' !'
        elif ((brightness >= 75)); then
            icon=' '
        elif ((brightness >= 50)); then
            icon=' '
        elif ((brightness >= 25)); then
            icon=' '
        else
            icon=' '
        fi

        _notify "$icon" "$brightness" "$BRIGHTNESS_COLOR"
    done
}

monitor_keyboard () {
    [ ! -d "$KEYBOARD_PATH" ] && echo "ERROR! keyboard path '$KEYBOARD_PATH' does not exist!" && print_help
    local max_brightness
    local perc
    local brightness
    local icon
    local dunst_icon="input-keyboard"

    local BRIGHT_PATH="$KEYBOARD_PATH/brightness_hw_changed"

    max_brightness="$(cat "$KEYBOARD_PATH/max_brightness")"
    perc="$(awk "BEGIN{print(${max_brightness}/100)}")"

    while :; do
        inotifywait -qe 'MODIFY' "$BRIGHT_PATH" > /dev/null
        brightness="$(cat "$BRIGHT_PATH")"
        brightness="$(awk "BEGIN{print(${brightness}/${perc})}")"
        brightness="${brightness%%.*}"

        if ((brightness == 100)); then
            icon=' '
        elif ((brightness == 50)); then
            icon=' '
        else
            icon=' '
        fi

        _notify "$icon" "$brightness" "$KEYBOARD_COLOR"
    done
}

monitor_volume () {
    local mute
    local volume
    local previous_mute="$(pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)')"
    local previous_volume="$(pactl get-sink-volume @DEFAULT_SINK@ | \
        grep -Po '[0-9]{1,3}(?=%)' | \
        uniq | tr '\n' ' ')"
    local icon
    local dunst_icon="audio-speakers"

    pactl subscribe | grep --line-buffered 'sink' | while read -r _unused_line; do
        mute="$(pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)')"
        volume="$(pactl get-sink-volume @DEFAULT_SINK@ | \
            grep -Po '[0-9]{1,3}(?=%)' | \
            uniq | tr '\n' ' ')"

        if [[ "$mute" == 'yes' ]]; then
            icon='婢'
        else
            if ((volume > 66)); then
                icon='墳'
            elif ((volume > 33)); then
                icon='奔'
            else
                icon='奄'
            fi
        fi

        # Playing media causes an update on sinks
        if ((volume == previous_volume)); then
            if [[ "$mute" == "$previous_mute" ]]; then
                continue
            else
                previous_mute="$mute"
                [ -z "$previous_mute" ] && continue
                _notify "$icon" "$volume" "$VOLUME_COLOR"
            fi
        else
            previous_volume="$volume"
            [ -z "$previous_volume" ] && continue
            _notify "$icon" "$volume" "$VOLUME_COLOR"
        fi

    done
}

print_help () {
printf "\033[0m\033[1m%s\033[0m \033[2m--parallel --monitoring --supported\033[0m

\033[1m--brightness\033[0m\tMonitor brightness
\033[1m--keyboard\033[0m\tMonitor keyboard backlight brightness
\033[1m--volume\033[0m\tMonitor volume

Example:
\033[1m%s --brightness --volume\033[0m\twatches both monitor brightness and volume level

If this is your first time running this, please modify the script to include the filepath to your keyboard and monitor backlight.
" "$0" "$0"
}

# support multiple monitoring
run_brightness=0
run_volume=0
run_keyboard=0
for arg in "$@"; do

    case "$arg" in
        '--brightness')
            run_brightness=1
        ;; '--volume')
            run_volume=1
        ;; '--keyboard')
            run_keyboard=1
        ;; *)
            print_help
            exit 1
        ;;
    esac

done
((run_brightness == 1)) && monitor_brightness &
((run_volume == 1)) && monitor_volume &
((run_keyboard == 1)) && monitor_keyboard &
wait
