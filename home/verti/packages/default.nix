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
        # TODO: figure out how to keep this sorted
        htop
        mission-center
        # nm-applet
        networkmanagerapplet
        tree
        vim # for fallback if neovim breakes for some reason, we do NOT like nano
        glow
        curl
        curl.dev
        playerctl
        wl-clipboard
        wl-gammactl
        nwg-look
        grim
        slurp
        unzip
        ripgrep
        brightnessctl
        fd
        fzf
        tty-clock
        spotify
        blueman
        qt6.qttools
        qt6.qtdeclarative
        obs-studio
        wf-recorder
        texstudio
        xev
        wev
        musescore
        # build stuff
        just
        cmake
        gnumake
        pkg-config
        bear
        clang-tools
        # langs
        gcc
        python3
        pkgs.python3Packages.matplotlib
        # parsers
        jq
        yq
        # font
        pkgs.nerd-fonts.ubuntu
        # the browser
        brave
        # for spotify_player
        openssl
        alsa-lib
        audacity
        pyright
        nil
    ];
}
