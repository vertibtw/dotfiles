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
        initContent = 
             ''
             if [[ -z "$ZELLIJ" ]] && [[ "$TERM_PROGRAM" != "vscode" ]]; then exec zellij fi
             '';
    };
#    home.sessionVariables.SHELL = "${pkgs.zsh}/bin/zsh";
}
