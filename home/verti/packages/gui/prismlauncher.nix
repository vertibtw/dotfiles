{ theme, ...}:
{
    programs.prismlauncher = {
        enable = true;

        themes.custom = {
          theme = {
            name = "Custom";
            colors = {
              background = "${theme.colors.background}";
              foreground = "${theme.colors.text1}";
            };
          };
          style = ''
            QWidget {
              font-family: "Inter";
            }
          '';
        };
    };
}
