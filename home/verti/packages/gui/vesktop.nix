{ pkgs, ... }:
{
    programs.vesktop = {
        enable = true;
        settings = {
            disableMinSize = true;
            minimizeToTray = true;
            tray = true;
            splashBackground = "#11111b";
            splashColor = "#f0f0f0";
            splashPixelated = true;
        };
    };
}
