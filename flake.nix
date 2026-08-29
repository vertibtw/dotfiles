{
  description = "have a nice day";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland-git = {
      url = "github:hyprwm/Hyprland";
    };

    qs-git = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qml-niri = {
      url = "github:imiric/qml-niri/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kopuz-git = {
      url = "github:Kopuz-org/kopuz";
    };

    vbar = {
      url = "github:vertibtw/vbar";
    };

    dwm = {
      url = "git+https://git.suckless.org/dwm?rev=f63cde9354504ee9cfecc07517c03736d0f90c26";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      mkHost = import ./lib/mkHost.nix { inherit inputs home-manager nixpkgs; };
    in
    {
      nixosConfigurations = {
        reimu = mkHost {
          hostname = "reimu";
          extraArgs = {
            profile = "desktop";
          };
        };
        marisa = mkHost {
          hostname = "marisa";
          extraArgs = {
            profile = "wsl";
          };
        };
      };
    };
}
