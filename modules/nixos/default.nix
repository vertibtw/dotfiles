{ profile, lib, ... }:
{
  imports = [
    # keep-sorted start
    ./bin
    ./locale.nix
    ./networking.nix
    ./programs
    ./security
    ./services
    ./settings.nix
    ./boot
    ./devices.nix
    ./fonts
    ./virtualisation.nix
    # keep-sorted end
  ];
}
