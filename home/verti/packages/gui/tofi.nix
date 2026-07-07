{ pkgs, theme, ... }:
{
    programs.tofi = {
        enable = true;
        settings = {
            anchor = "center";
            width = 500;
            height = 400;

            font = "Scientifica";
            font-size = 14;

            border-width = 2;
            border-color = theme.colors.blue;
            outline-width = 0;

            corner-radius = 10;

            background-color = theme.colors.background2;
            text-color = theme.colors.text1;
            prompt-color = theme.colors.blue;
            prompt-text = "run: ";
            placeholder-color = theme.colors.gray;
            input-color = theme.colors.text1;

            selection-color = theme.colors.text1;
            selection-background = theme.colors.surface0;

            horizontal = true;
            num-results = 8;
            result-spacing = 15;
        };
    };
}
