local mons = {}

function mons.init()
  hl.monitor({
      output   = "eDP-1",
      mode     = "preferred",
      position = "0x0",
      scale    = "auto",
  })

  hl.monitor({
      output   = "HDMI-A-1",
      mode     = "preferred",
      position = "0x-1080",
      scale    = "1",
  })
end

return mons
