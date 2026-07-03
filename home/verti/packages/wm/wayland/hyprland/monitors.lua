local M = {}

function M.init()
  hl.on("monitor.added", function(mon)
    if mon.name ~= "eDP-1" then
      hl.monitor({
        output = "eDP-1",
        mode     = "preferred",
        position = "0x0",
        scale    = "1",
        disabled = true,
      })
      hl.monitor({
        output   = "HDMI-A-1",
        mode     = "preferred",
        position = "0x0",
        scale    = 1,
      })
    end
  end)

  hl.on("monitor.removed", function(mon)
    if mon.name ~= "eDP-1" then
      hl.monitor({
        output = "eDP-1",
        mode     = "preferred",
        position = "0x0",
        scale    = "1",
        disabled = true,
      })
    end
  end)
end

return M
