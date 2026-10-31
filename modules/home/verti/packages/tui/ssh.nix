{ config, ... }:
{
  sops.secrets."reimu/ssh-pv" = { };
  sops.secrets."reimu/ssh-pub" = {
    path = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = config.sops.secrets."reimu/ssh-pv".path; # TODO: make it work for marisa
        identitiesOnly = true;
    };
    matchBlocks."*" = {
      addKeysToAgent = "yes";
      serverAliveInterval = 60;
    };
  };
}
