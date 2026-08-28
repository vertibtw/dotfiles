{ ... }:
{
  services.picom.enable = true;

  xdg.configFile."picom/picom.conf".text = ''
    backend = "glx";
    vsync = true;

    animations = (
      {
        triggers = [ "open" ];
        preset = "slide-in";
        direction = "down";
        duration = 0.2;
      },
      {
        triggers = [ "close" ];
        preset = "slide-out";
        direction = "down";
        duration = 0.2;
      }
    );
  '';
}
