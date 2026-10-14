{
  lib,
  pkgs,
  profile,
  ...
}:
lib.mkIf (profile == "desktop") {
  services.printing = {
    enable = true;
    browsing = true;
    defaultShared = false;
    drivers = with pkgs; [
      hplip
      cups-filters
    ];
    extraConf = ''
      SystemGroup @wheel
    '';
  };
}
