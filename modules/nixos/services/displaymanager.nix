{ pkgs, inputs, ... }:
{
  services.displayManager = {
    gdm = {
      enable = true;
    };
    sessionPackages = [
      inputs.hyprland-git.packages.${pkgs.stdenv.hostPlatform.system}.hyprland # for the .desktop file
    ];
  };
  environment.etc."X11/sessions/dwm.desktop".text = ''
      [Desktop Entry]
      Name=DWM
      Exec=/home/verti/.local/bin/dwm.sh
      Type=Application
  '';

}
