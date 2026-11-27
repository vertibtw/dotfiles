{ lib, profile, ... }:
lib.mkIf (profile == "desktop") {
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 2; # so this fuckass error doesn't happen again.
  };
  boot.initrd.compressor = "zstd";
  boot.initrd.compressorArgs = [ "-19" ];

  boot.loader.efi.canTouchEfiVariables = true;
}
