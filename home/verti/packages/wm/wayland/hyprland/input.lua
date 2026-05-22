-- there's really no need for this, but it's cool so
local M = {
  devices = {},
  input = {},
}

function M.devices.init()
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

function M.input.init()
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

function M.init()
  input.devices.init()
  input.input.init()
end

return M
