{ pkgs, ... }:
{
  users.users.verti = {
    isNormalUser = true;
    description = "verti";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "input"
    ];

    shell = pkgs.fish;
  };
}
