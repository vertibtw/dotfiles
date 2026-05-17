{ ... }:
{
    services.open-webui = {
      enable = true;
      port = 6767;
      environment = {
        WEBUI_AUTH = "False";
      };
    };
}
