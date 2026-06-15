# sort of hacky but anything to avoid the huge flake.nix
{ inputs, home-manager, nixpkgs }:
{ hostname, system ? "x86_64-linux", hmProfile, extraArgs ? {} }:
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit inputs; };
  modules = [
    # cuz paths are relative to this file
    ../hosts/${hostname}
    ../modules/nixos
    ../modules/home
    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = {
        inherit inputs;
        theme = import ../modules/themes;
      } // extraArgs;
      home-manager.users.verti = hmProfile;
    }
  ];
}
