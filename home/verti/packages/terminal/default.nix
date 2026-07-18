{ lib, profile, ... }:
{
  imports = [
    #keep-sorted start
    ./fastfetch.nix
    ./git.nix
    ./neovim.nix
    ./ssh.nix
    #keep-sorted end
  ]
  ++ lib.optionals (profile == "desktop") [
    #keep-sorted start
    ./kitty.nix
    #keep-sorted end
  ]
  ++ lib.optionals (profile == "wsl") [
    #keep-sorted start
    ./zellij.nix
    #keep-sorted end
  ];
}
