{ inputs, ... }:
{
  imports = [ inputs.shell.homeManagerModules.default ];
  programs.notquickshell = {
    enable = true;
    settings = {
      theme = "catppuccin mocha";
      bar = {
        thickness = 20;
        margin-left = 300;
        margin-right = 300;
        margin-top = 10;
      };
    };
  };
}
