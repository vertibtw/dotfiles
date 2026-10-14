{ lib, profile, pkgs, ... }:
lib.mkIf (profile == "desktop") {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
    };
  };
}
