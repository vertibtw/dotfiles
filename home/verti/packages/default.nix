{ pkgs, lib, profile,... }:
{
  imports = [
    ./shell
    ./terminal
  ] ++ lib.optionals(profile == "desktop") [ ./gui ./cursors ./wm ];
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # keep-sorted start
    bear
    cargo
    clang-tools
    cmake
    curl
    curl.dev
    fd
    ffmpeg
    fzf
    gcc
    glow
    gnumake
    hare
    imagemagick
    jq
    just
    keep-sorted
    nil
    nixfmt
    openssl
    pkg-config
    pkgs.nerd-fonts.ubuntu
    psmisc
    pyright
    python3
    ripgrep
    rustc
    tree
    tty-clock
    unzip
    vim
   yq
    yt-dlp
    # keep-sorted end
  ] ++ lib.optionals(profile == "desktop") [
    #keep-sorted start
    alsa-lib
    audacity
    blueman
    brave
    brightnessctl
    cliphist
    grim
    gtk4-layer-shell
    gtkmm4
    htop
    hyprshade
    kdePackages.dolphin
    kdePackages.qt6ct
    libnotify
    libsForQt5.qt5ct
    mission-center
    nautilus
    networkmanagerapplet
    nwg-look
    obs-studio
    osu-lazer-bin
    pkgs.python3Packages.matplotlib
    playerctl
    qt6.qtdeclarative
    qt6.qttools
    slurp
    spotify
    swaylock
    texstudio
    thunar
    usbutils
    wev
    wf-recorder
    wl-clipboard
    wl-gammactl
    xev
    # keep-sorted end
  ];
}
