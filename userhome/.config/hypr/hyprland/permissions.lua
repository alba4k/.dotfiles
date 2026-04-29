--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions
--
-- ##############################################
-- ###               PERMISSIONS              ###
-- ##############################################

local allow_screencopy = {
    "/usr/bin/grim",
    "/usr/bin/hyprlock",
    "/usr/bin/hyprpicker",
    "/usr/lib/xdg-desktop-portal-hyprland"
}
local allow_keyboard = {
    -- Laptop
    "dell-privacy-driver",
    "power-button",
    "intel-hid-events",
    "video-bus",
    "dell-wmi-hotkeys",
    "intel-hid-5-button-array",
    "at-translated-set-2-keyboard",
    -- ETH apartment
    "logitech-usb-receiver-keyboard",
    "logitech-g502-x-ls",
    "logitech-g515-ls-tkl",
    "solaar-keyboard",
    -- Home
    "generic-usb-audio-consumer-control",
    "hp-hp-usb-c-dock-g5-system-control",
    "generic-usb-audio",
    "logitech-g502-hero-gaming-mouse-keyboard",
    "logitech-g413-carbon-mechanical-gaming-keyboard.*",
    -- Bluetooth
    "galaxy-buds-pro.*",
    "buds4-pro.*",
    "s23-di-aaron.*",
    "tab-s10+-di-aaron.*",
    "ue-boom-2-di-aaron.*",
    -- Other
    "wl_keyboard",
}

for _, bin in ipairs(allow_screencopy) do
    hl.permission({binary = bin, type = "screencopy", mode = "allow"})
end
for _, dev in ipairs(allow_keyboard) do
    hl.permission({binary = dev, type = "keyboard", mode = "allow"})
end

hl.permission({binary = "/usr/bin/hyprpm", type = "plugin", mode = "allow"})
hl.permission({binary = ".*", type = "keyboard", mode = "ask"})
