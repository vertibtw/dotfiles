{ theme, ... }:
{
    programs.zathura = {
        enable = true;
        options = {
            recolor = "true";
            recolor-darkcolor = theme.colors.text1;
            recolor-lightcolor = theme.colors.surface0;

            default-bg = theme.colors.background;
            default-fg = theme.colors.text1;

            statusbar-bg = theme.colors.background;
            statusbar-fg = theme.colors.text1;

            inputbar-bg = theme.colors.background;
            inputbar-fg = theme.colors.text1;

            notification-bg = theme.colors.background;
            notification-fg = theme.colors.text1;

            highlight-color = theme.colors.blue;
            highlight-active-color = theme.colors.pink;

            selection-notification-color = theme.colors.surface0;
        };
    };
}
