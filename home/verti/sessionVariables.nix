{ pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    SHELL = "${pkgs.fish}/bin/fish";
    CMAKE_PREFIX_PATH = "${pkgs.curl.dev}";
  };
}
