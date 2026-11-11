{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "fetch";
      src = ./src/fetch.rs;
      dontUnpack = true;
      nativeBuildInputs = [ pkgs.rustc ];
      buildPhase = "rustc $src -O -o fetch";
      installPhase = "install -Dm755 fetch $out/bin/fetch";
    })
  ];
}
