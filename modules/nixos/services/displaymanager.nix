{ pkgs, inputs , ... }:
{
    services.displayManager = {
        gdm = {
            enable = true;
        };
        sessionPackages = [
            inputs.hyprland-git.packages.${pkgs.system}.hyprland # for the .desktop file
        ];
    };

    services.desktopManager.gnome.enable = true; # will delete this later probably
}
