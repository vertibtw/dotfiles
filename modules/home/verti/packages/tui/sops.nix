{ config, inputs, ...}:
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];
  sops = {
    defaultSopsFile = ../../../../../secrets/secrets.json;

    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets = {
        email = {};
        gh_key = {};
    };
  };

}
