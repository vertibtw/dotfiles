{ lib, profile, ... }:
{
  imports = [
    ./eza.nix
    ./git.nix
    ./ssh.nix
    ./zsh.nix
    ./fish.nix
    ./neovim.nix
    ./starship.nix
    ./fastfetch.nix
  ]
  ++ lib.optionals (profile == "desktop") [
    ./kitty.nix
    ./cava.nix
  ]
  ++ lib.optionals (profile == "wsl") [
    ./zellij.nix
  ];
}
