{ pkgs, ... }: {
  services.printing = {
    enable = true;
    browsing = true;
    defaultShared = false;
    drivers = with pkgs; [ hplip cups-filters ];
    extraConf = ''
      SystemGroup @wheel
    '';
  };
}
