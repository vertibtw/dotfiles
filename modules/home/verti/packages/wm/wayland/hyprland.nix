{
  pkgs,
  theme,
  ...
}:
let
  rgb = c: builtins.substring 1 6 c;
in
{
  home.packages = [
    pkgs.hyprland
  ];

  xdg.configFile."hypr/hyprland.lua".source = ./hyprland/hyprland.lua;
  xdg.configFile."hypr/shaders".source = ./shaders;
  xdg.configFile."hypr/colorscheme.lua".text = ''
    -- COLORSCHEME
    local colorscheme = {
      color1 = "rgb(${rgb theme.colors.blue})",
      color2 = "rgb(${rgb theme.colors.purple})",
      inactive = "rgb(${rgb theme.colors.background})"
    }
  '';
  xdg.configFile."hypr/desktop_icons.qml".source = ./hyprland/desktop_icons.qml;
}
