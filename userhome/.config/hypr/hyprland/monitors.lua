--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Basics/Monitors
--                https://wiki.hypr.land/Configuring/Advanced-and-Cool/Expanding-functionality
--
-- ##############################################
-- ###                MONITORS                ###
-- ##############################################

hl.monitor({output = "", mode = "preferred", position = "auto", scale = 1})

function DetectScreenLayout() -- global, also needed in binds.lua
    local mons = hl.get_monitors()
    local screens = {}
    local layout = nil

    for _, mon in ipairs(mons) do
        -- Check for "home" setup (two SMBX2450)
        if mon.description:find("SMBX2450") then
            table.insert(screens, mon.name)
            if #screens == 2 then
                layout = "home"
                break
            end
        -- Check for "zurich" setup (one DELL P3425WE)
        elseif mon.description:find("DELL P3425WE") then
            screens[1] = mon.name
            layout = "zurich"
            break
        -- Check if plugged into some other display
        elseif mon.name ~= "FALLBACK" and mon.name ~= "eDP-1" then
            layout = "docked"
            break
        end
    end

    return layout, screens
end

print(DetectScreenLayout())

-- Shikane-like behavior
hl.on("monitor.added", function()
    local layout, screens = DetectScreenLayout()

    if layout == "home" then
        table.sort(screens) -- Ensure L/R order is consistent
        hl.monitor({output = "eDP-1", disabled = true})
        hl.monitor({output = screens[1], mode = "1920x1080@72Hz", position = "0x0", scale = 1})
        hl.monitor({output = screens[2], mode = "1920x1080@72Hz", position = "1920x0", scale = 1})
    elseif layout == "zurich" then
        table.sort(screens)
        hl.monitor({output = "eDP-1", disabled = true})
        hl.monitor({output = screens[1], mode = "3440x1440@100Hz", position = "0x0", scale = 1})
    else
        return
    end

    -- They seem to crash quite often
    hl.exec_cmd("pidof -q kdeconnect-indicator || kdeconnect-indicator")
    hl.exec_cmd("pidof -q hyprpaper || hyprpaper")
    hl.exec_cmd("pidof -q hyprsunset || hyprsunset")
    hl.exec_cmd("pidof -q waybar || waybar")
end)

-- Ensure eDP-1 turns on when disconnecting everything
hl.on("monitor.removed", function()
    local layout = DetectScreenLayout()

    if layout == nil then
        hl.monitor({output = "eDP-1", mode = "preferred", position = "auto", disabled = false})
        --hl.exec_cmd("hyprctl reload")
    end
    
    -- They seem to crash quite often
    hl.exec_cmd("pidof -q kdeconnect-indicator || kdeconnect-indicator")
    hl.exec_cmd("pidof -q hyprpaper || hyprpaper")
    hl.exec_cmd("pidof -q hyprsunset || hyprsunset")
    hl.exec_cmd("pidof -q waybar || waybar")
end)
