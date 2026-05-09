{ pkgs, ... }:
{
    programs.fuzzel = {
        enable = true;
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
