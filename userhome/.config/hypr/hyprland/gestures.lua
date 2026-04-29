--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures
--                https://wiki.hypr.land/Configuring/Basics/Variables/#gestures
--
-- ##############################################
-- ###              ENVIRONNMENT              ###
-- ##############################################


hl.config({
    gestures = {
        workspace_swipe_create_new = true,
        workspace_swipe_forever = true,
        workspace_swipe_direction_lock = false,

        close_max_timeout = 100
    }
})

-- 3-finger swipes
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

--[[
hl.gesture({
    fingers = 3,
    direction = "down",
    action = function() hl.exec_cmd("if pidof wlogout || pidof slurp; then pkill -f /usr/bin/slurp; else wlogout; fi") end
})
]]
--[[
hl.gesture({
    fingers = 3,
    direction = "up",
    action = function() hl.exec_cmd("if pidof wlogout || pidof slurp; then pkill wlogout; else ~/.config/hypr/scripts/screenshot.sh; fi") end
})
]]

-- 3-finger swipes
hl.gesture({
  fingers = 3,
  direction = "swipe",
  action = "move",
})

-- Pinches
hl.gesture({
  fingers = 3,
  direction = "pinch",
  action = "fullscreen",
})
hl.gesture({
  fingers = 4,
  direction = "pinch",
  action = "float",
})

-- Closing windows
hl.gesture({
  fingers = 3,
  mods = "SUPER",
  direction = "pinch",
  action = "close",
})
hl.gesture({
  fingers = 3,
  mods = "SUPER",
  direction = "swipe",
  action = "close",
})
hl.gesture({
  fingers = 4,
  mods = "SUPER",
  direction = "pinch",
  action = "close",
})
hl.gesture({
  fingers = 4,
  mods = "SUPER",
  direction = "swipe",
  action = "close",
})
