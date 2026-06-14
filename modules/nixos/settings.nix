{
    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        # parallel builds
        max-jobs = "auto";
        cores = 0;

        auto-optimise-store = true;
        show-trace = true;

    };
    nix.gc = {
       automatic = true;
       dates = "weekly";
       options = "--delete-older-than 5d";
    };
}
