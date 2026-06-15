{
    boot.loader.systemd-boot = {
        enable = true;
        configurationLimit = 5; # so this fuckass error doesn't happen again.
    };

    boot.loader.efi.canTouchEfiVariables = true;
}
