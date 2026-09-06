{ pkgs, ... }:
let
  # nix doesn't like this just being directly in the systemPackages array thing for some reason, I have no idea why tbh.
  scripts = [
    (pkgs.writeShellScriptBin "scripts.yuri" (import ./yuri.nix))
    (pkgs.writeShellScriptBin "scripts.dirgrep" (import ./dirgrep.nix))
  ];
in
{
    environment.systemPackages = scripts;
}
