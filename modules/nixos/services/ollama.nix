{ lib, profile, ... }:
lib.mkIf (profile == "desktop") {
  services.ollama = {
    enable = true;
    loadModels = [ "mistral" ];
  };
}
