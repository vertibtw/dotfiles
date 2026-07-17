{ ... }:
{
  services.open-webui = {
    enable = false;
    port = 6767;
    environment = {
      WEBUI_AUTH = "False";
    };
  };
}
