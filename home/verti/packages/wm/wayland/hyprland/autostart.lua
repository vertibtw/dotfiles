local M = {}

function M.init()
  hl.exec_cmd("kitty -e fastfetch")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("vesktop -m --ozone-platform wayland --enable-blink-features=MiddleClickAutoscroll")
  hl.exec_cmd("qs")

  for i = 0, 20 do
    hl.exec_cmd("hyprctl notify 1 2000 0 hello")
  end
end

return M
