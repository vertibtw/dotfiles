{
  lib,
  pkgs,
  profile,
  ...
}:
{
  environment.systemPackages = [
    (pkgs.callPackage ./helium-upd.nix { })
  ]
  ++ lib.optionals (profile == "desktop") [
    (pkgs.callPackage ./package.nix { })
  ];
}
