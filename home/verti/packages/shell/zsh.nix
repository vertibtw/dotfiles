{ pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell"; # I like the default
            plugins = [
                "git"
                "sudo"
            ];
        };
    };
#    home.sessionVariables.SHELL = "${pkgs.zsh}/bin/zsh";
}
