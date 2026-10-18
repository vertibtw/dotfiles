{ profile, lib, ... }:
{
  imports = [
    # keep-sorted start
    ./bin
    ./boot
    ./devices.nix
    ./fonts
    ./locale.nix
    ./networking.nix
    ./programs
    ./security
    ./services
    ./settings.nix
    ./users
    ./virtualisation.nix
    # keep-sorted end
  ];
}
