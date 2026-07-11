{ pkgs, theme, ... }:
{
    services.dunst = {
        enable = true;
        settings = {
            global = {
                origin = "top-center";
                offset = "(200,0)";
                width = "(200,200)";
                height = "(100,150)";
                frame_width = 1;
                frame_color = theme.colors.text1;
            };

            urgency_normal = {
                background = theme.colors.background;
                foreground = theme.colors.text1;
                timeout = 10;
            };

            urgency_critical = {
                background = theme.colors.background;
                foreground = theme.colors.text1;
                timeout = 10;
                frame_color = theme.colors.red;
            };

            urgency_low = {
                background = theme.colors.background;
                foreground = theme.colors.text2;
                timeout = 5;
                frame_color = theme.colors.background;
            };

        };
    };
}
