{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "fetch";
      src = ./src/fetch.hs;
      dontUnpack = true;
      nativeBuildInputs = [ pkgs.ghc ];
      buildPhase = "cp $src fetch.hs; ghc fetch.hs -O -outputdir build -o fetch";
      installPhase = "install -Dm755 fetch $out/bin/fetch";
    })
  ];
}
