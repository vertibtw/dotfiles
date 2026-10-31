{
  lib,
  pkgs,
  profile,
  ...
}:
lib.mkIf (profile == "desktop") {
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernelParams = [
    "quiet"
    "loglevel=3"
    "fastboot"
  ];

  boot.kernelModules = [
    # camera stuff idk
    "v4l2loopback"
    # for waydroid
    "ashmem_linux"
    "binder_linux"
    "ip_tables"
    "iptable_nat"
    "iptable_filter"
    "iptable_mangle"
  ];

}
