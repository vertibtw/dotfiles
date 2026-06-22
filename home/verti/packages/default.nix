{ pkgs, lib, ... }:
{
    imports = [
        ./gui
        ./shell
        ./terminal
        ./wm
    ];
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
        # keep-sorted start
        alsa-lib
        audacity
        bear
        blueman
        brave
        brightnessctl
        clang-tools
        cmake
        curl
        curl.dev
        fd
        fzf
        gcc
        glow
        gnumake
        grim
        htop
        imagemagick
        jq
        just
        keep-sorted
        libnotify
        mission-center
        networkmanagerapplet
        nil
        nwg-look
        obs-studio
        openssl
        osu-lazer-bin
        pkg-config
        pkgs.nerd-fonts.ubuntu
        pkgs.python3Packages.matplotlib
        playerctl
        pyright
        python3
        qt6.qtdeclarative
        qt6.qttools
        ripgrep
        slurp
        spotify
        texstudio
        tree
        tty-clock
        unzip
        vim
        wev
        wf-recorder
        wl-clipboard
        wl-gammactl
        xev
        yq
        # keep-sorted end
    ];
}
