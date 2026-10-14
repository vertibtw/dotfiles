{lib, profile, ...}:
lib.mkIf (profile == "desktop") {
  services.xserver = {
    enable = true;
    xkb = {
        layout = "pl";
        # variant = "";
    };
  };
}
