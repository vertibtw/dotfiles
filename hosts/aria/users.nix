{ pkgs, ...}:
{
  users.users.verti = {
    isNormalUser = true;
    description = "verti";
    extraGroups = [ "networkmanager" "wheel" "docker" ];

    shell = pkgs.zsh;
  };
}