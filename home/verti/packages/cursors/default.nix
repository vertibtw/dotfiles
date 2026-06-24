{ pkgs, ... }:
let
  xp-cursor = pkgs.stdenvNoCC.mkDerivation {
    name = "xp-cursor";
    src = ./xp-cursor.zip;

    nativeBuildInputs = [ pkgs.unzip ];

    installPhase = ''
      mkdir -p $out/share/icons
      cp -r . $out/share/icons/xp-cursor
    '';
  };
in
{
  home.pointerCursor = {
    name = "xp-cursor";
    package = xp-cursor;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
