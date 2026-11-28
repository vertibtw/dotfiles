{
  xdg.desktopEntries.nvim-wrapper = {
    name = "neovim but in kitty";
    exec = "kitty -e nvim %F";
    mimeType = [
      "text/plain"
      "text/markdown"
    ];
    terminal = false;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "image/png" = [ "feh.desktop" ];
      "image/jpeg" = [ "feh.desktop" ];
      "text/plain" = [ "nvim-wrapper.desktop" ];
      "inode/directory" = [ "thunar.desktop" ];
    };
  };
}
