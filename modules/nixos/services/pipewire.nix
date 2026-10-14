{lib, profile, ...}:
lib.mkIf (profile == "desktop") {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
