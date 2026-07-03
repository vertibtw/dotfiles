{ pkgs, inputs, ... }:
{
    imports = [ inputs.shell.homeManagerModules.default ];
    programs.notquickshell = {
        enable = true;
        settings = {
            theme = "catppuccin mocha";
            bar = {
                position = "top";
                thickness = 20;
                margin-left = 20;
                margin-right = 20;
                margin-top = 10;
            };
        };
    };
}
