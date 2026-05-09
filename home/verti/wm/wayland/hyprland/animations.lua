local animations = {}

function animations.init()
  hl.curve("in",      { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
  hl.curve("out",     { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
  hl.curve("linear",  { type = "bezier", points = { {0, 0},       {1, 1}       } })

  hl.curve("spring_thingy",    { type = "spring", mass = 0.8, stiffness = 60, dampening = 20 })

  hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
  hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "out" })
  hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "spring_thingy" })
  hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  bezier= "in",  style = "popin 87%" })
  hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "out", style = "popin 87%" })
  hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "in",  style = "fade" })
  hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "out", style = "fade" })
  hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "linear" })
  hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "linear" })
  hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "linear", style = "fade" })
  hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "linear", style = "fade" })
  hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "linear", style = "fade" })
  hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "linear" })

  hl.config({
    animations = {
      enabled = true,
    },
    -- this kinda fits here, idk where else to put it
    decoration = {
          rounding       = 1,
          rounding_power = 2,
          active_opacity   = 1.0,
          inactive_opacity = 0.9,
          shadow = {
              enabled      = false,
          },
          blur = {
              enabled   = false,
          },
      },
  })
end

return animations
