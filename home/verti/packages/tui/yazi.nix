{ theme, ... }:
{
  programs.yazi = {
    enable = true;
    theme = {
      manager = {
        cwd = {
          fg = theme.colors.cyan;
        };
        hovered = {
          fg = theme.colors.background;
          bg = theme.colors.blue;
        };
        preview_hovered = {
          underline = true;
        };
        find_keyword = {
          fg = theme.colors.yellow;
          bold = true;
        };
        find_position = {
          fg = theme.colors.purple;
          italic = true;
        };

        marker_selected = {
          fg = theme.colors.yellow;
          bg = theme.colors.yellow;
        };
        marker_copied = {
          fg = theme.colors.green;
          bg = theme.colors.green;
        };
        marker_cut = {
          fg = theme.colors.red;
          bg = theme.colors.red;
        };

        tab_active = {
          fg = theme.colors.background;
          bg = theme.colors.blue;
        };
        tab_inactive = {
          fg = theme.colors.text1;
          bg = theme.colors.background;
        };
      };

      status = {
        separator_open = "";
        separator_close = "";

        progress_label = {
          fg = theme.colors.cyan;
          bold = true;
        };
        progress_normal = {
          fg = theme.colors.blue;
          bg = theme.colors.background;
        };
        progress_error = {
          fg = theme.colors.red;
          bg = theme.colors.background;
        };
      };

      mode = {
        normal_main = {
          fg = theme.colors.background;
          bg = "blue";
          bold = true;
        };
        normal_alt = {
          fg = theme.colors.blue;
          bg = theme.colors.background;
        };

        select_main = {
          fg = theme.colors.background;
          bg = theme.colors.green;
          bold = true;
        };
        select_alt = {
          fg = theme.colors.green;
          bg = theme.colors.background;
        };

        unset_main = {
          fg = theme.colors.background;
          bg = theme.colors.red;
          bold = true;
        };
        unset_alt = {
          fg = theme.colors.red;
          bg = theme.colors.background;
        };
      };
    };
  };
}
