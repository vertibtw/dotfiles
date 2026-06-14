{ pkgs, ... }:
{
    programs.fish = {
        enable = true;
        shellAliases = {
            g = "git";
            gc = "git commit -m";
            gp = "git push";
            gs = "git status";
            ff = "fastfetch";
            snvim = "sudo nvim";
            "..." = "cd ../../";
            "...." = "cd ../../../";
            "....." = "cd ../../../../";
        };
    };

}
