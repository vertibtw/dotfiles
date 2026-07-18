{
  ...
}:
{
  home.username = "verti";
  home.homeDirectory = "/home/verti";

  home.stateVersion = "25.11";

  imports = [
    # keep-sorted start
    ./sessionVariables.nix
    ./packages
    # keep-sorted end
  ];
}
