{
  lib,
  pkgs,
  ...
}:

let
  release = import ./release.nix;

  source =
    release.assets.${pkgs.stdenv.hostPlatform.system}
      or (throw "helium: they didn't build the release :( (or you're on arm) ${pkgs.stdenv.hostPlatform.system}");

  deps = [
    pkgs.alsa-lib
    pkgs.at-spi2-atk
    pkgs.at-spi2-core
    pkgs.atk
    pkgs.cairo
    pkgs.cups
    pkgs.dbus
    pkgs.expat
    pkgs.fontconfig
    pkgs.freetype
    pkgs.gdk-pixbuf
    pkgs.glib
    pkgs.gtk3
    pkgs.gtk4
    pkgs.libdrm
    pkgs.libgbm
    pkgs.libGL
    pkgs.libkrb5
    pkgs.libpulseaudio
    pkgs.libuuid
    pkgs.libva
    pkgs.libx11
    pkgs.libxcb
    pkgs.libxcomposite
    pkgs.libxcursor
    pkgs.libxdamage
    pkgs.libxext
    pkgs.libxfixes
    pkgs.libxi
    pkgs.libxkbcommon
    pkgs.libxrandr
    pkgs.libxrender
    pkgs.libxscrnsaver
    pkgs.libxshmfence
    pkgs.libxtst
    pkgs.nspr
    pkgs.nss
    pkgs.pango
    pkgs.pciutils
    pkgs.pipewire
    pkgs.stdenv.cc.cc.lib
    pkgs.udev
    pkgs.vulkan-loader
    pkgs.wayland
    pkgs.zlib
  ];

  qtLibs = [
    pkgs.qt5.qtbase
    pkgs.qt6.qtbase
  ];

  rpath = lib.makeLibraryPath (deps ++ qtLibs);
in
pkgs.stdenv.mkDerivation {
  pname = "helium";
  version = release.version;

  src = pkgs.fetchurl { inherit (source) url sha256; };

  dontConfigure = true;
  dontBuild = true;
  dontPatchELF = true;

  nativeBuildInputs = [
    pkgs.autoPatchelfHook
    pkgs.wrapGAppsHook3
  ];

  buildInputs = deps ++ [
    pkgs.adwaita-icon-theme
    pkgs.gsettings-desktop-schemas
  ];

  preFixup = ''
    addAutoPatchelfSearchPath --no-recurse ${lib.getLib pkgs.qt5.qtbase}/lib ${lib.getLib pkgs.qt6.qtbase}/lib

    gappsWrapperArgs+=(
      --prefix LD_LIBRARY_PATH : "${rpath}"
      --prefix PATH : "${
        lib.makeBinPath [
          pkgs.coreutils
          pkgs.xdg-utils
        ]
      }"
      --add-flags "--ozone-platform-hint=auto"
    )
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/opt $out/bin $out/share/applications $out/share/icons/hicolor/256x256/apps

    cp -r . $out/opt/helium
    chmod -R u+w $out/opt/helium

    ln -s $out/opt/helium/helium-wrapper $out/bin/helium
    ln -s $out/opt/helium/chromedriver $out/bin/chromedriver

    substituteInPlace $out/opt/helium/helium.desktop \
      --replace-fail "Exec=helium" "Exec=$out/bin/helium"

    install -Dm644 $out/opt/helium/helium.desktop $out/share/applications/helium.desktop
    install -Dm644 $out/opt/helium/product_logo_256.png $out/share/icons/hicolor/256x256/apps/helium.png

    rm $out/opt/helium/libvulkan.so.1
    ln -s ${lib.getLib pkgs.vulkan-loader}/lib/libvulkan.so.1 $out/opt/helium/libvulkan.so.1

    runHook postInstall
  '';

  doInstallCheck = true;
  installCheckPhase = ''
    runHook preInstallCheck
    $out/bin/helium --version
    runHook postInstallCheck
  '';

  meta.mainProgram = "helium";
}
