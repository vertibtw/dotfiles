{ pkgs, inputs, ... }:
{ 
    home.packages = [
        inputs.hyprland-git.packages.${pkgs.system}.hyprland
    ];

    xdg.configFile."hypr".source = ./hyprland;
}
