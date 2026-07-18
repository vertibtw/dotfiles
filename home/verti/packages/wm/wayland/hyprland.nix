{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.hyprland-git.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
  ];

  xdg.configFile."hypr".source = ./hyprland;
}
