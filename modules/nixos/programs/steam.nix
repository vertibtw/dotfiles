{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    fontPackages = [ pkgs.scientifica ];
  };

  programs.gamescope.enable = true;
}
