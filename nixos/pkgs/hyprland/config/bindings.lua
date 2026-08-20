local opt = require("options")

local Super = opt.Super

hl.bind(Super .. " + M", hl.dsp.exec_cmd(opt.Menu))
hl.bind(Super .. " + T", hl.dsp.exec_cmd(opt.Terminal))
hl.bind(Super .. " + E", hl.dsp.exec_cmd(opt.FileManager))

hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd(opt.Lockout))

hl.bind(Super .. " + W", hl.dsp.window.close())
hl.bind(Super .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(Super .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(Super .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(Super .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(Super .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(Super .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(Super .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(Super .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(Super .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(Super .. " + SHIFT + P", hl.dsp.window.pin())

-- Switch workspace 1-9
for i = 1, 9 do
    hl.bind(Super .. " + " .. i, hl.dsp.focus({ workspace = i }))
end

-- Move active window to workspace 1-9
for i = 1, 9 do
    hl.bind(Super .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(Super .. " + RETURN", hl.dsp.workspace.toggle_special("term"))
hl.bind(Super .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:term" }))
hl.bind(Super .. " + O", hl.dsp.workspace.toggle_special("browser"))

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(Super .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

hl.bind(Super .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
