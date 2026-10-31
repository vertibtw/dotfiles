{pkgs, ...}:
{
boot.plymouth = {
  enable = true;
  theme = "hexagon";
  themePackages = [
    (pkgs.adi1090x-plymouth-themes.override {
      selected_themes = [ "hexagon" ];
    })
  ];
};
}
