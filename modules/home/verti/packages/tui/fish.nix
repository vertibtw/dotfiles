{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      nr = "sudo rebuild switch --flake /home/verti/dotfiles/#reimu";
      ls = "eza";
      g = "git";
      gc = "git commit -m";
      gp = "git push";
      gs = "git status";
      ff = "fastfetch";
      yz = "yazi";
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
