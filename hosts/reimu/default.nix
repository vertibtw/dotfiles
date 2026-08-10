{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "reimu";
  system.stateVersion = "25.11";

  hardware.graphics.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      inputs.hyprland-git.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = [ "hyprland" "gtk" ];
  };
}
