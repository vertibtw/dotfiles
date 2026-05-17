{ config, pkgs, inputs, ... }:

{
  imports =
  [
    ./hardware-configuration.nix
    ./modules.nix
    ./users.nix
  ];
 
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11"; # Note to self: just do not touch this or something
}
