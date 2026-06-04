local general       = require("general")
local binds         = require("binds")
local animations    = require("animations")
local monitors      = require("monitors")
local input         = require("input")
local init          = require("autostart")
local env           = require("env")


-- everything is functions because uh it looked cooler uh
-- it's probably not the meta on like r/unixporn but
-- unfortunately I do not give a fuck

general.init()
binds.init()
animations.init()
monitors.init()
input.init()
env.init()

hl.on("hyprland.start", init.init)
