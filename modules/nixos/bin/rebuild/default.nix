{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      pname = "rebuild";
      version = "0.1.0";
      src = ./src/rebuild.rs;
      dontUnpack = true;
      nativeBuildInputs = [ pkgs.rustc ];
      buildPhase = "rustc $src -O -o rebuild";
      installPhase = "mkdir -p $out/bin; install -Dm755 rebuild $out/bin/rebuild";
    })
  ];
}
