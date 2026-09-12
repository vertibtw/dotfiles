{ ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      osd-font-size = 32;
      osd-bar-align-y = 0.9;
      osd-bar-w = 60;
      osd-bar-h = 1;
      osd-duration = 1500;
      osc = "yes";
      osd-level = 1;
    };
  };
}
