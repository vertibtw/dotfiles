{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "reimu";
  system.stateVersion = "25.11";

  hardware.graphics.enable = true;

  xdg.portal.config.common.default = [
    "hyprland"
    "gtk"
  ];
}
