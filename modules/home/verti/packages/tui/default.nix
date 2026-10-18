{ lib, profile, ... }:
{
  imports = [
    # keep-sorted start
    ./eza.nix
    ./fastfetch.nix
    ./fish.nix
    ./git.nix
    ./neovim.nix
    ./ssh.nix
    ./starship.nix
    ./yazi.nix
    ./zsh.nix
    #keep-sorted end
  ]
  ++ lib.optionals (profile == "desktop") [
    ./kitty.nix
    ./cava.nix
  ]
  ++ lib.optionals (profile == "wsl") [
    ./zellij.nix
  ];
}
