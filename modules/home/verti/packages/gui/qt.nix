{ pkgs, theme, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style.name = "Fusion";
  };

  home.sessionVariables.QT5_QPA_PLATFORMTHEME = "qt5ct";

  home.file.".config/qt6ct/qt6ct.conf".text = theme.qt.main;
  home.file.".config/qt6ct/colors/Catppuccin-Mocha.conf".text = theme.qt.palette;
  home.file.".config/qt5ct/qt5ct.conf".text = theme.qt.main;
  home.file.".config/qt5ct/colors/Catppuccin-Mocha.conf".text = theme.qt.palette;
}
