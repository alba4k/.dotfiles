--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions
--
-- ##############################################
-- ###                UTILITIES               ###
-- ##############################################

local hyprsunset_enabled = false
function ToggleHyprsunset()
    if hyprsunset_enabled then
        hl.exec_cmd("hyprctl hyprsunset reset temperature")
        print("Hyprsunset on")
    else
        hl.exec_cmd("hyprctl hyprsunset temperature 4000")
        print("Hyprsunset off")
    end
    hyprsunset_enabled = not hyprsunset_enabled
end

local notified_low = false
local notified_critical = false
local low_level = 20
local crit_level = 10

local function check_battery()
    local status_file = io.open("/sys/class/power_supply/BAT0/status", "r")
    local status = status_file and status_file:read("*all"):gsub("%s+", "") or ""
    if status_file then
        status_file:close()
    end

    if status ~= "Discharging" then
        notified_low = false
        notified_critical = false
        return
    end

    local file = io.open("/sys/class/power_supply/BAT0/capacity", "r")
    if not file then
        return
    end

    local level = tonumber(file:read("*all"))
    file:close()

    if level <= crit_level and not notified_critical then
        --hl.notification.create({text = "Batteria quasi scarica!", timeout = 5000, icon = 0, color = C_RED, font_size = 17})
        hl.exec_cmd("notify-send -t 10000 -u critical -i system-error -a Sistema -h boolean:transient:true -h string:synchronous:LOWBAT 'Batteria quasi scarica!' 'Meno del " .. crit_level .. "% rimanente'")
        hl.exec_cmd("pw-play /usr/share/sounds/freedesktop/stereo/dialog-warning.oga")

        notified_critical = true
        notified_low = true
    elseif level <= low_level and not notified_low and level > crit_level then
        --hl.notification.create({text = "Livello batteria basso!", timeout = 5000, icon = 0, color = C_ORANGE, font_size = 17})
        hl.exec_cmd("notify-send -t 10000 -u critical -i system-error -a Sistema -h boolean:transient:true -h string:synchronous:LOWBAT 'Livello batteria basso!' 'Meno del " .. low_level .. "% rimanente'")
        hl.exec_cmd("pw-play /usr/share/sounds/freedesktop/stereo/dialog-warning.oga")

        notified_low = true
    end
end

hl.timer(check_battery, {timeout = 30000, type = "repeat"})
