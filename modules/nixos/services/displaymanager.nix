{ pkgs, inputs, ... }:
{
  services.displayManager = {
    gdm = {
      enable = true;
    };
    sessionPackages = [
      inputs.hyprland-git.packages.${pkgs.stdenv.hostPlatform.system}.hyprland # for the .desktop file
    ];
  };
}
