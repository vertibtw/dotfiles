{ pkgs, ... }:
{
    services.ollama = {
        enable = true;
        loadModels = [ "mistral" ]; # yes I make it call me a good boy
    };
}
