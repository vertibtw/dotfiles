{ pkgs, ... }:
{
    services.ollama = {
        enable = true;
        loadModels = [ "mistral" ];
    };
}
