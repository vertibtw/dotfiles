{ pkgs, ... }:
{
    programs.fuzzel = {
        enable = false;
        settings = {
            main = {
                terminal = "kitty";
                layer = "overlay";
                prompt = "<3  | ";
                message = "everybody loves systemd";
            };
        };
    };
}
