{ pkgs, inputs, ... }:
{
    # not installing as a hm module cuz it was breaking and I do not have attention span to fix it
    home.packages = [
        inputs.hyprland-git.packages.${pkgs.system}.hyprland
    ];

    xdg.configFile."hypr".source = ./hyprland;
}
