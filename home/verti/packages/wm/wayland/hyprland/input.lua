-- there's really no need for this, but it's cool so
local input = {
  devices = {},
  input = {},
}

function input.devices.init()
  -- thinkpad nipple heh
  hl.device({
      name        = "tpps/2-elan-trackpoint",
      sensitivity = 1,
  })

  hl.device({
    name          = "synps/2-synaptics-touchpad",
    sensitivity   = "0.8"
  })
end

function input.input.init()
  hl.config({
      input = {
          kb_layout  = "pl",
          follow_mouse = 1,
          sensitivity = 0,
          touchpad = {
              natural_scroll = false,
          },
      },
  })
end

function input.init()
  input.devices.init()
  input.input.init()
end

return input
