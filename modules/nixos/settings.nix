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

    substituters = [
      "https://cache.nixos.org/"
      "https://hyprland.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
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
}
