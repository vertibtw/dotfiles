local M = {}

-- might as well lmao
function M.init()
  hl.env("XCURSOR_THEME", "xp-cursor")
  hl.env("XCURSOR_SIZE", "24")
  hl.env("HYPRCURSOR_SIZE", "24")
  hl.env("GTK_THEME", "adw-gtk3-dark")
  hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
  hl.env("QT5_QPA_PLATFORMTHEME", "qt5ct")
end
return M
