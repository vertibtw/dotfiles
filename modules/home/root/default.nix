{
  ...
}:
{
  home.username = "root";
  home.homeDirectory = "/root";

  home.stateVersion = "25.11";

  imports = [
    # keep-sorted start
    ./packages
    # keep-sorted end
  ];
}
