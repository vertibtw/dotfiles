# TODO: split this into more files ig, maybe remove some stuff idk
{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "aria";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  services.xserver.enable = true;

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  services.displayManager.sessionPackages = [
    inputs.hyprland-git.packages.${pkgs.system}.hyprland # for the .desktop file
  ];

  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  console.keyMap = "pl2";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.zsh.enable = true;
  users.users.verti = {
    isNormalUser = true;
    description = "verti";
    extraGroups = [ "networkmanager" "wheel" ];

    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  services.openssh.enable = true;

  system.stateVersion = "25.11"; # Note to self: just do not touch this or something
}
