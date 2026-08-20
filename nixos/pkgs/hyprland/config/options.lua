-- Environment variables
hl.env("GDK_SCALE", "1")
hl.env("XCURSOR_SIZE", "14")
hl.env("HYPRCURSOR_SIZE", "14")

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

-- Variables, shared with the other modules via require("options")
local M = {}

M.Super       = "ALT"
M.Terminal    = "alacritty"
M.Code        = "code"
M.FileManager = M.Terminal .. " -e yazi"
M.Menu        = "wofi --term " .. M.Terminal .. " --show drun"
M.Browser     = "google-chrome-stable"
M.Interact    = "bytedance-feishu"
M.Lockout     = "wlogout --protocol layer-shell"

return M
