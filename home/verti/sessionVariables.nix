{ pkgs, ... }:
{
    home.sessionVariables = {
        SHELL = "${pkgs.fish}/bin/fish";
        CMAKE_PREFIX_PATH = "${pkgs.curl.dev}";
    };
}
