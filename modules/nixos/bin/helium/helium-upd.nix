{
  lib,
  pkgs,
}:
pkgs.stdenv.mkDerivation {
  name = "helium-upd";
  src = ./src/helium-upd.rs;
  dontUnpack = true;
  nativeBuildInputs = [
    pkgs.makeWrapper
    pkgs.rustc
  ];
  buildPhase = "rustc $src -O -o helium-upd";
  installPhase = ''
    install -Dm755 helium-upd $out/bin/helium-upd
    wrapProgram $out/bin/helium-upd --prefix PATH : ${
      lib.makeBinPath [
        pkgs.curl
        pkgs.jq
      ]
    }
  '';
}
