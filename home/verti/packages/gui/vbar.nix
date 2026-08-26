{ inputs, ... }:
{
  imports = [ inputs.vbar.homeManagerModules.default ];
  programs.vbar = {
    enable = true;
    settings = {
      theme = "catppuccin mocha";
      bar = {
        thickness = 20;
        margin-left = 300;
        margin-right = 300;
        margin-top = 10;
        modules-left   = ["workspaces"];
        modules-center = ["clock"];
        modules-right = ["battery" "volume"];
        ws-indicator-type = "id";
      };
    };
  };
}
