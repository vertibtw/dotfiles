{ pkgs, theme, config, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };

    gtk3.extraConfig."gtk-application-prefer-dark-theme" = true;
    gtk3.extraCss = theme.gtk.gtk3;
    gtk4.extraCss = theme.gtk.gtk4;
    gtk4.theme = config.gtk.theme;
  };
}
