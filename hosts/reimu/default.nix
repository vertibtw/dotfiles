{ config, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "reimu";
  system.stateVersion = "25.11"; # Note to self: just do not touch this or something
}
