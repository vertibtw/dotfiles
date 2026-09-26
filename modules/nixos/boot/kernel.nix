{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernelParams = [
    "quiet"
    "loglevel=3"
    "fastboot"
  ];

  boot.kernelModules = [
    # for waydroid
    "ashmem_linux"
    "binder_linux"
    "ip_tables"
    "iptable_nat"
    "iptable_filter"
    "iptable_mangle"
  ];

}
