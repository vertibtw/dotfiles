{ pkgs, inputs, ... }:
{
    home.packages = [
        (inputs.kopuz-git.packages.${pkgs.stdenv.hostPlatform.system}.default)
    ];
}
