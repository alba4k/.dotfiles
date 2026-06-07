--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations
--                https://wiki.hypr.land/Configuring/Basics/Variables/#animations
--
-- ##############################################
-- ###               ANIMATIONS               ###
-- ##############################################

hl.config({
    animations = {
        enabled = true,
        workspace_wraparound = false,
    }
})

-- Rotating border gradient
hl.curve("linear", {type = "bezier", points = {{0, 0}, {0, 0}}})
hl.curve("rubber", { type = "spring", mass = 1, stiffness = 300, dampening = 20})
hl.animation({leaf = "borderangle", enabled = true, speed = 100, bezier = "linear"})

-- Other animations
hl.animation({leaf = "windows", enabled = true, speed = 3, bezier = "default"})
hl.animation({leaf = "workspaces", enabled = true, speed = 5, bezier = "default"})
--hl.animation({leaf = "windows", enabled = true, speed = 1, spring = "rubber"})
--hl.animation({leaf = "workspaces", enabled = true, speed = 5, spring = "rubber"})

-- Windowrules
hl.window_rule({match = {class = "lxpolkit"}, animation = "slide top"})
hl.window_rule({match = {class = "flameshot", title = "flameshot"}, animation = "slide bottom"})

-- Layerrules
hl.layer_rule({match = {namespace = "rofi"}, animation = "popin"})
hl.layer_rule({match = {namespace = "waybar"}, animation = "slide top"})
hl.layer_rule({match = {namespace = "logout_dialog"}, animation = "slide top"})
hl.layer_rule({match = {namespace = "hyprpicker"}, no_anim = true})
