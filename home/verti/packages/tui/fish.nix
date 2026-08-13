{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      g = "git";
      gc = "git commit -m";
      gp = "git push";
      gs = "git status";
      ff = "fastfetch";
      snvim = "sudo nvim";
      "..." = "cd ../../";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";
    };

    shellInit = ''
      set -g fish_greeting
    '';
  };

}
