{ pkgs, ... }:
{
    programs.kitty = {
        enable = true;
        settings = {
            font_family = "Ubuntu Nerd Font";
            scrollback_lines = 100000;
            enable_audio_bell = false;

            window_padding_width = 0; # neovim fix sort of


            # colors (sort of amoled catppuccin)

            cursor = "#f5e0dc";

            # black:
            color0 = "#000000";
            color8 = "#000000";
            # red:
            color1 = "#f38ba8";
            color9 = "#eba0ac";
            # green:
            color2 = "#a6e3a1";
            color10 = "#94e2d5";
            # yellow:
            color3 = "#f9e2af";
            color11 = "#fab387";
            # blue:
            color4 = "#89b4fa";
            color12 = "#74c7ec";
            # magenta:
            color5 = "#cba6f7";
            color13 = "#f5c2e7";
            # cyan:
            color6 = "#89dceb";
            color14 = "#94e2d5";
            # white:
            color7 = "#cdd6f4";
            color15 = "#b4befe";
        };
    };
}
