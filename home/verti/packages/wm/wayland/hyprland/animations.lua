local M = {}

function M.init()
  hl.curve("in",      { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
  hl.curve("out",     { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
  hl.curve("linear",  { type = "bezier", points = { {0, 0},       {1, 1}       } })

  hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 1,  bezier= "in",  style = "slide" })
  hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1, bezier = "out", style = "slide" })
  hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "in",  style = "fade" })
  hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1,  bezier = "out", style = "fade" })
  hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1, bezier = "out", style = "slide" })
  hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1, bezier = "in", style = "slide" })
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

return M
