-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Custom bindings.
-- SUPER+ALT+RETURN was Tmux; now runs a custom launch script.
hl.unbind("SUPER + ALT + RETURN")
o.bind("SUPER + ALT + RETURN", "Launch script", "ghostty -e ~/launch.sh")

-- SUPER+SHIFT+W was Omawrite; now Typora.
hl.unbind("SUPER + SHIFT + W")
o.bind("SUPER + SHIFT + W", "Typora", { launch = "typora --enable-wayland-ime" })

-- Vim-style focus movement.
-- SUPER+J was toggle split, SUPER+K was keybindings menu, SUPER+L was workspace layout toggle.
hl.unbind("SUPER + H")
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")
o.bind("SUPER + H", nil, hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + J", nil, hl.dsp.focus({ direction = "d" }))
o.bind("SUPER + K", nil, hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + L", nil, hl.dsp.focus({ direction = "r" }))

-- Toggle the laptop display.
-- SUPER+P was pseudo window.
hl.unbind("SUPER + P")
o.bind("SUPER + P", "Toggle laptop monitor", "~/.config/hypr/scripts/monitors.sh")
