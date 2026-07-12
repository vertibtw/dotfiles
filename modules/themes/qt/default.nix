{ colors }: let
  base = ''
    [Appearance]
    style=Fusion
    custom_palette=true
    color_scheme_path=Catppuccin-Mocha.conf
    icon_theme=breeze
  '';

  # QPalette::ColorRole indexing:
  #   0=Window, 1=WindowText, 2=Button, 3=ButtonText, 4=Light, 5=Midlight,
  #   6=Dark, 7=Mid, 8=Text, 9=BrightText, 10=Base, 11=AlternateBase,
  #   12=ToolTipBase, 13=ToolTipText, 14=Highlight, 15=HighlightedText,
  #   16=Link, 17=LinkVisited, 18=PlaceholderText, 19=Accent (Qt6)
  palette = ''
    [ColorScheme]
    active[0]=${colors.background}
    active[1]=${colors.text1}
    active[2]=${colors.surface0}
    active[3]=${colors.text1}
    active[4]=${colors.surface1}
    active[5]=${colors.surface0}
    active[6]=${colors.background2}
    active[7]=${colors.background2}
    active[8]=${colors.text1}
    active[9]=${colors.text1}
    active[10]=${colors.background}
    active[11]=${colors.surface0}
    active[12]=${colors.surface0}
    active[13]=${colors.text1}
    active[14]=${colors.purple}
    active[15]=${colors.background}
    active[16]=${colors.blue}
    active[17]=${colors.pink}
    active[18]=${colors.subtext0}
    active[19]=${colors.purple}

    inactive[0]=${colors.background}
    inactive[1]=${colors.text1}
    inactive[2]=${colors.surface0}
    inactive[3]=${colors.text1}
    inactive[4]=${colors.surface1}
    inactive[5]=${colors.surface0}
    inactive[6]=${colors.background2}
    inactive[7]=${colors.background2}
    inactive[8]=${colors.text1}
    inactive[9]=${colors.text1}
    inactive[10]=${colors.background}
    inactive[11]=${colors.surface0}
    inactive[12]=${colors.surface0}
    inactive[13]=${colors.text1}
    inactive[14]=${colors.surface1}
    inactive[15]=${colors.subtext0}
    inactive[16]=${colors.blue}
    inactive[17]=${colors.pink}
    inactive[18]=${colors.subtext0}
    inactive[19]=${colors.surface1}

    disabled[0]=${colors.background}
    disabled[1]=${colors.subtext0}
    disabled[2]=${colors.surface0}
    disabled[3]=${colors.subtext0}
    disabled[4]=${colors.surface1}
    disabled[5]=${colors.surface0}
    disabled[6]=${colors.background2}
    disabled[7]=${colors.background2}
    disabled[8]=${colors.subtext0}
    disabled[9]=${colors.subtext0}
    disabled[10]=${colors.background}
    disabled[11]=${colors.surface0}
    disabled[12]=${colors.surface0}
    disabled[13]=${colors.subtext0}
    disabled[14]=${colors.surface1}
    disabled[15]=${colors.subtext0}
    disabled[16]=${colors.subtext0}
    disabled[17]=${colors.subtext0}
    disabled[18]=${colors.subtext0}
    disabled[19]=${colors.surface1}
  '';
in {
  main = base;
  inherit palette;
}
