{ config, theme, ... }:
{
  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font 10";

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      display-drun = " ";
      display-run = " ";
      display-window = " ";
      drun-display-format = "{name}";
    };

    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          bg = mkLiteral "${theme.colors.background}";
          bg-alt = mkLiteral "${theme.colors.background2}";
          bg-selected = mkLiteral "${theme.colors.purple}";
          fg = mkLiteral "${theme.colors.text1}";
          fg-alt = mkLiteral "${theme.colors.text4}";
          border-color = mkLiteral "${theme.colors.purple}";

          background-color = mkLiteral "@bg";
          text-color = mkLiteral "@fg";
        };

        "window" = {
          width = mkLiteral "600px";
          border = mkLiteral "2px";
          border-color = mkLiteral "@border-color";
          border-radius = mkLiteral "0px";
          padding = mkLiteral "15px";
        };

        "mainbox" = {
          spacing = mkLiteral "8px";
          background-color = mkLiteral "transparent";
        };

        "inputbar" = {
          spacing = mkLiteral "15px";
          padding = mkLiteral "8px";
          background-color = mkLiteral "@bg-alt";
          border-radius = mkLiteral "0px";
          children = [
            (mkLiteral "prompt")
            (mkLiteral "entry")
          ];
        };

        "prompt" = {
          text-color = mkLiteral "@bg-selected";
          font = "JetBrainsMono Nerd Font 14";
          vertical-align = mkLiteral "0.5";
          background-color = mkLiteral "inherit";
        };

        "entry" = {
          placeholder = "procrastinate more, idiot.";
          placeholder-color = mkLiteral "@fg-alt";
          text-color = mkLiteral "@fg";
          vertical-align = mkLiteral "0.5";
          background-color = mkLiteral "inherit";
        };

        "listview" = {
          lines = 8;
          columns = 1;
          spacing = mkLiteral "5px";
          scrollbar = false;
          background-color = mkLiteral "transparent";
          padding = mkLiteral "10px 0px 0px 0px";
        };

        "element" = {
          padding = mkLiteral "10px";
          border-radius = mkLiteral "0px";
          spacing = mkLiteral "15px";
          background-color = mkLiteral "transparent";
        };

        "element normal.normal, element alternate.normal" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@fg";
        };

        "element selected.normal" = {
          background-color = mkLiteral "@bg-selected";
          text-color = mkLiteral "@bg";
        };

        "element-text" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
        };

        "element-icon" = {
          size = mkLiteral "24px";
          background-color = mkLiteral "inherit";
        };
      };
  };
}
