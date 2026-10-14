{ lib, profile, ... }:
lib.mkIf (profile == "desktop") {
  # idk where else to put this but it's for a scanner device
  hardware.sane.enable = true;
  # tablet
  services.udev.extraRules = ''
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="037b", MODE="0660", GROUP="input"
  '';
}
