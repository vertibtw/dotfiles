{ pkgs, ... }:
{
    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                source = "nixos_small";
                padding.right = 2;
            };
            display = {
                size = {
                  binaryPrefix = "si";
                };
                color = "blue";
                separator = "  ";
            };
            modules = [
                "title"
                "separator"
                "os"
                "uptime"
                "kernel"
                "shell"
                "wm"
                "separator"
                "colors"
            ];
        };
    };
}
