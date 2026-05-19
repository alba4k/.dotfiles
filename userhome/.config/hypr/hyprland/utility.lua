--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions
--
-- ##############################################
-- ###                UTILITIES               ###
-- ##############################################

local hyprsunset_state = false
function ToggleHyprsunset()
    if hyprsunset_state then
        hl.exec_cmd("hyprctl hyprsunset reset temperature")
        hyprsunset_state = false
        print("Hyprsunset on")
    else
        hl.exec_cmd("hyprctl hyprsunset temperature 4000")
        hyprsunset_state = true
        print("Hyprsunset off")
    end
end
