{ ... }:
{
      programs.zellij = {
        enable = true;
        settings = {
          pane_frames = false;
          theme = "default";
          mouse_mode = true;
        };
      };
}