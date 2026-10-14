{ lib, pkgs, profile, ... }:
lib.mkIf (profile == "desktop") {
  fonts.packages = with pkgs; [
    scientifica
    nerd-fonts.jetbrains-mono
    inter
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
}
