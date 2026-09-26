{
  networking = {
    networkmanager.enable = true;
    firewall.trustedInterfaces = [ "waydroid0" ];
    nftables.enable = true;
  };
}
