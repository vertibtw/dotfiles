local M = {}

function M.init()
  hl.config({
      misc = {
          force_default_wallpaper = 1,
          disable_hyprland_logo   = true,
      },
  })
end

return M
