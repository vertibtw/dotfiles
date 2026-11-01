{ inputs, ... }:
{
  imports = [ inputs.vbar.homeManagerModules.default ];

  programs.vbar = {
    enable = true;
    settings = {
      theme = "catppuccin mocha";
      bar = {
        thickness = 10;
        modules-left = [
          "workspaces"
          "layout"
        ];
        modules-center = [ "media" ];
        modules-right = [
          "cpicker"
          "record"
          "battery"
          "volume"
          "systray"
          "clock"
        ];
        ws-indicator-type = "id";
      };
    };
  };
}
