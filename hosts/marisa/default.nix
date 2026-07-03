{ inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = "verti";

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "marisa";
  system.stateVersion = "25.11";
}
