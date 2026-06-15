{
  description = "<3";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland-git = {
        url = "github:hyprwm/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs"; # to avoid stupid errors
    };

    qs-git = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    mkHost = import ./lib/mkHost.nix { inherit inputs home-manager nixpkgs; };
  in
  {
    nixosConfigurations = {
        reimu = mkHost {
            hostname = "reimu";
            hmProfile = import ./modules/nixos/profiles/desktop.nix;
            extraArgs = { isWsl = false; };
        };
        marisa = mkHost {
            hostname = "marisa";
            hmProfile = import ./modules/nixos/profiles/wsl.nix;
            extraArgs = { isWsl = true; };
        };
    };
  };
}
