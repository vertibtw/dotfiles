local general       = require("general")
local colorscheme   = require("colors")
local binds         = require("binds")
local animations    = require("animations")
local monitors      = require("monitors")
local input         = require("input")
local misc          = require("misc")
local init          = require("autostart")
local env           = require("env")

local terminal    = "kitty"
local filemgr     = "dolphin"
local menu        = "fuzzel"
local screenshot  = 'grim -g "$(slurp)" - | wl-copy'

general.init(colorscheme)
binds.init(terminal, filemgr, menu, screenshot)
animations.init()
monitors.init()
input.init()
misc.init()
env.init()

hl.on("hyprland.start", init.init) -- not calling the init cuz hypland wants the function itself
