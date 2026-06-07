--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Basics/Monitors
--                https://wiki.hypr.land/Configuring/Advanced-and-Cool/Expanding-functionality
--
-- ##############################################
-- ###                MONITORS                ###
-- ##############################################

hl.monitor({output = "", mode = "preferred", position = "auto", scale = 1})

local function detectLayout() -- global, also needed in binds.lua
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
        elseif mon.description == "DELL P3425WE" then
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

local function applyLayout()
    local layout, screens = detectLayout()
    hl.config({decoration = {screen_shader = ""}})

    if layout == "home" then
        table.sort(screens) -- Ensure L/R order is consistent
        hl.monitor({output = "eDP-1", disabled = true})
        hl.monitor({output = screens[1], mode = "1920x1080@72Hz", position = "0x0"})
        hl.monitor({output = screens[2], mode = "1920x1080@72Hz", position = "1920x0"})
    elseif layout == "zurich" then
        hl.monitor({output = "eDP-1", disabled = true})
        hl.monitor({output = "desc:DELL P3425WE", mode = "3440x1440@100Hz", position = "0x0"})
    elseif layout ~= "docked" then -- layout == nil, fallback or laptop
        hl.config({decoration = {screen_shader = "~/.config/hypr/assets/rounded_corners.frag"}})
        hl.monitor({output = "eDP-1", mode = "preferred", position = "auto", disabled = false})
    end

    --print("Applied monitor configuration (" .. tostring(layout) .. ")")
end

-- Shikane-like behavior
hl.on("monitor.added", applyLayout)
hl.on("monitor.removed", applyLayout)

-- Used by waybar
-- could be a lua func but that would block hyprland
hl.on("monitor.layout_changed", function() hl.exec_cmd("~/.config/hypr/scripts/ddcutil.sh") end)

-- Actions on lid switch (cause logind works inconsistently)
hl.bind("switch:on:Lid Switch", function()
        local mons = hl.get_monitors()
        if #mons == 1 and mons[1].name == "eDP-1" then
            hl.exec_cmd("systemctl suspend-then-hibernate")
        else
            hl.monitor({output = "eDP-1", disabled = true})
        end
end, {locked = true})
hl.bind("switch:off:Lid Switch", function()
        local layout = detectLayout()
        if layout == nil or layout == "docked" then -- not a known layout where eDP-1 should stay off
            hl.monitor({output = "eDP-1", mode = "preferred", position = "auto", disabled = false})
        end
end, {locked = true})

applyLayout() -- run on every reload / hyprland start

