{ lib, profile, ... }:
lib.mkIf (profile == "desktop") {
  programs.niri.enable = true;
}
