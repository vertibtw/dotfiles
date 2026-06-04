local colorscheme = require("misc.colors")
local M = {}

function M.init()
  hl.config({
      general = {
          gaps_in  = 5,
          gaps_out = 10,

          border_size = 1,

          col = {
            active_border   = { colors = {colorscheme.color1, colorscheme.color2}, angle = 45 },
            inactive_border = colorscheme.inactive,
          },

          resize_on_border = false, -- windows ahh behavior, we do NOT want this
      },
      misc = {
          force_default_wallpaper = 1,
          disable_hyprland_logo   = true,
      },
 })
end

return M
