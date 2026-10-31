{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "rebuild";
      src = ./src/rebuild.rs;
      dontUnpack = true;
      nativeBuildInputs = [ pkgs.rustc ];
      buildPhase = "rustc $src -O -o rebuild";
      installPhase = "mkdir -p $out/bin; install -Dm755 rebuild $out/bin/rebuild";
    })
  ];
}
