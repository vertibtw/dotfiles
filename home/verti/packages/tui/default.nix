{ lib, profile, ... }:
{
  imports = [
    # keep-sorted start
    ./eza.nix
    ./git.nix
    ./ssh.nix
    ./zsh.nix
    ./fish.nix
    ./neovim.nix
    ./starship.nix
    ./fastfetch.nix
    ./yazi.nix
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
