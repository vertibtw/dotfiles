# yes daddy gnome, you know bes- mpfhmff
{ pkgs, theme, ... }:

{
    gtk = {
        enable = true;
        theme = {
            name = "adw-gtk3";
            package = pkgs.adw-gtk3;
        };
    };

    gtk3.extraCss = theme.gtk.gtk3;
    gtk4.extraCss = theme.gtk.gtk4;

}
