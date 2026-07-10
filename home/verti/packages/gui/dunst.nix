{ pkgs, theme, ... }:
{
    services.dunst = {
        enable = true;
        settings = {
            global = {
                origin = "center";
                width = "(300,200)";
                height = "(0,150)";
                transparency = 10;
                frame_color = theme.colors.text1;
            };
        };
    };
}
