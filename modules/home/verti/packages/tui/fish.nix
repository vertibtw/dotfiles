{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      g = "git";
      gc = "git commit -m";
      gp = "git push";
      gpf = "git push --force";
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

    functions = {
      nr = ''
        helium-upd /home/verti/dotfiles
        sudo rebuild switch --flake /home/verti/dotfiles/#reimu $argv
      '';
    };
  };

}
