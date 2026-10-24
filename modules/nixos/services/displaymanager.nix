{
  lib,
  profile,
  ...
}:
lib.mkIf (profile == "desktop") {
  services.displayManager.gdm.enable = true;

  environment.etc."X11/sessions/dwm.desktop".text = ''
    [Desktop Entry]
    Name=DWM
    Exec=/home/verti/.local/bin/dwm.sh
    Type=Application
  '';

}
