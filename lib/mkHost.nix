# sort of hacky but anything to avoid the huge flake.nix
{
  inputs,
  home-manager,
  nixpkgs,
}:
{
  hostname,
  system ? "x86_64-linux",
  extraArgs ? { },
}:
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit inputs;
    profile = extraArgs.profile or "wsl";
  };
  modules = [
    ../hosts/${hostname}
    ../modules/nixos
    inputs.sops-nix.nixosModules.sops
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.sharedModules = [
        inputs.sops-nix.homeManagerModules.sops
      ];
      home-manager.extraSpecialArgs = {
        inherit inputs;
        theme = import ../modules/themes;
      }
      // extraArgs;
      home-manager.users.verti = ../modules/home/verti;
      home-manager.users.root = ../modules/home/root;
    }
  ];
}
