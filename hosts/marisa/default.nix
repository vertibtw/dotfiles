{ inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = "verti";

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
