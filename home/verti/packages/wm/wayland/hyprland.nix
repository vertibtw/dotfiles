{
  pkgs,
  inputs,
  theme,
  ...
}:
let
  rgb = c: builtins.substring 1 6 c;
in
{
  home.packages = [
    inputs.hyprland-git.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
  ];

  xdg.configFile."hypr" = {
    source = ./hyprland;
    recursive = true;
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 3;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(${rgb theme.colors.blue})";
          inner_color = "rgb(${rgb theme.colors.background})";
          outer_color = "rgb(${rgb theme.colors.background})";
          outline_thickness = 5;
          placeholder_text = "770";
          shadow_passes = 2;
        }
      ];

    };
  };
}
