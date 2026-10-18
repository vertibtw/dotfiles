{ pkgs, ... }:
{
  users.users.verti = {
    isNormalUser = true;
    description = "verti";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "input"
    ];

    shell = pkgs.fish;
  };
}
