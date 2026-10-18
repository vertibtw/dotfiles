{ theme, ... }:
let
  rgba = c: builtins.substring 1 6 c + "ff";
in
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Scientifica:size=14";
        prompt = ">";
        lines = 10;
        width = 40;
        horizontal-pad = 20;
        vertical-pad = 20;
        inner-pad = 10;
        match-mode = "fuzzy";
      };
      colors = {
        background = rgba theme.colors.background2;
        text = rgba theme.colors.text1;
        prompt = rgba theme.colors.blue;
        input = rgba theme.colors.text1;
        placeholder = rgba theme.colors.gray;
        match = rgba theme.colors.blue;
        selection = rgba theme.colors.surface0;
        selection-text = rgba theme.colors.text1;
        selection-match = rgba theme.colors.blue;
        border = rgba theme.colors.blue;
      };
      border = {
        width = 2;
        radius = 0;
      };
    };
  };
}
