local opt = require("options")

-- Monitors
hl.monitor({ output = "",         mode = "preferred", position = "auto", scale = 1 })
hl.monitor({ output = "eDP-1",    mode = "preferred", position = "auto", scale = 1.2 })
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto", scale = 1 })
hl.monitor({ output = "desc:Shenzhen KTC Technology Group M27P6", mode = "preferred", position = "auto", scale = 1.6 })

-- Workspace rules
hl.workspace_rule({ workspace = "1",               on_created_empty = opt.Code })
hl.workspace_rule({ workspace = "special:browser",  on_created_empty = opt.Browser })
hl.workspace_rule({ workspace = "special:term",     on_created_empty = "[float; center; size monitor_w*0.8 monitor_h*0.8; opacity 0.9] " .. opt.Terminal })
hl.workspace_rule({ workspace = "special:interact", on_created_empty = "[float; center; size monitor_w*0.8 monitor_h*0.8] " .. opt.Interact })

-- Disable the internal laptop screen (overrides the eDP-1 rule above)
hl.monitor({ output = "eDP-1", disabled = true })
