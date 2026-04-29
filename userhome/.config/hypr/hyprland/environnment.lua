--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hyprland.org/Configuring/Environment-variables
--
-- ##############################################
-- ###              ENVIRONNMENT              ###
-- ##############################################

-- XDG session info
hl.env("HYPRCURSOR_SIZE", "Hyprland")
hl.env("XDG_DESKTOP_SESSION", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Explicitly set some dirs, just in case
hl.env("XDG_CONFIG_HOME", "/home/alba4k/.config")
hl.env("XDG_CACHE_HOME", "/home/alba4k/.cache")
hl.env("XDG_DATA_HOME", "/home/alba4k/.local/share")

-- Qt
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Other platforms
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("SDL_VIDEODRIVER", "wayland,x11,windows")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("GTK_THEME", "catppuccin-mocha-mauve-standard+default")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- Cursor
hl.env("XCURSOR_THEME", "BreezeX-Dark")
hl.env("XCURSOR_SIZE", "30") -- two less than xcursor
hl.env("HYPRCURSOR_THEME", "BreezeX-Dark-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "32")

-- Random stuff
hl.env("MAKEFLAGS", "-j14")
hl.env("MANPAGER", "sh -c 'sed -u -e \"s/\\x1B\\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'")
--hl.env("SSH_AUTH_SOCK", "/run/user/1000/ssh-agent.socket")
hl.env("SSH_AUTH_SOCK", "/home/alba4k/.bitwarden-ssh-agent.sock")
hl.env("EDITOR", "/bin/nvim")
