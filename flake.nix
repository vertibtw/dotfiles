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
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.aria = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };

      modules = [
        ./hosts/aria
        ./modules/nixos

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit inputs;
            theme = import ./modules/themes;
          };

          home-manager.users.verti = import ./modules/nixos/profiles/desktop.nix;
        }
      ];
    };
  };
}
