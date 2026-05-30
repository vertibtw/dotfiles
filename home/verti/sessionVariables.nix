{ pkgs, ... }:
{
    home.sessionVariables = {
        SHELL = "${pkgs.zsh}/bin/zsh";
        CMAKE_PREFIX_PATH = "${pkgs.curl.dev}"; #kinda hacky but works for now
    };
}
