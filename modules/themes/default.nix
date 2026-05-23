let
    colors = import ./catppuccin.nix;
in
{
    colors = colors;
    emacs = import ./emacs {inherit colors;};
}