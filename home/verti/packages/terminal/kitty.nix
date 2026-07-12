{ pkgs, theme, ... }:
{
    programs.kitty = {
        enable = true;
        settings = {
            font_family = "Ubuntu Nerd Font";
            scrollback_lines = 100000;
            enable_audio_bell = false;

            window_padding_width = 0; # neovim fix sort of

            cursor = theme.colors.text1;

            # black:
            color0 = theme.colors.background;
            color8 = theme.colors.background2;
            # red:
            color1 = theme.colors.red;
            color9 = theme.colors.orange;
            # green:
            color2 = theme.colors.green;
            color10 = theme.colors.cyan;
            # yellow:
            color3 = theme.colors.yellow;
            color11 = theme.colors.orange;
            # blue:
            color4 = theme.colors.blue;
            color12 = theme.colors.cyan;
            # magenta:
            color5 = theme.colors.pink;
            color13 = theme.colors.purple;
            # cyan:
            color6 = theme.colors.blue;
            color14 = theme.colors.cyan;
            # white:
            color7 = theme.colors.text1;
            color15 = theme.colors.text2;
        };
    };
}
