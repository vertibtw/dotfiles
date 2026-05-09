{ pkgs, ... }:
{
    programs.spotify-player = {
        enable = true;
        settings = {
            copy_command = {
                command = "wl-copy";
                args = [];
            };
        };
    };
}
