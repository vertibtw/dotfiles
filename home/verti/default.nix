{ lib, isWsl, config, pkgs, ... }:

{
  home.username = "verti";
  home.homeDirectory = "/home/verti";

  home.stateVersion = "25.11";

  imports = [
    ./sessionVariables.nix
  ] ++  lib.optionals (!isWsl) [./packages];
}
