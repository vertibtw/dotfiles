{ pkgs, ... }:
{
  users.users.verti = {
    isNormalUser = true;
    description = "verti";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
      "input"
    ];

    shell = pkgs.fish;
  };
}
