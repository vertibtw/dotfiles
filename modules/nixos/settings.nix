{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    # parallel builds
    max-jobs = "auto";
    cores = 0;

    auto-optimise-store = true;
    show-trace = true;

    substituters = [ "https://cache.nixos.org/" ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];

    trusted-users = [
      "root"
      "@wheel"
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 5d";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
