{ lib, profile, ... }:
lib.mkIf (profile == "desktop") {
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
