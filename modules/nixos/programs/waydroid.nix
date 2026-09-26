{ pkgs, inputs, ...}:
{
    virtualisation.waydroid = {
        enable = true;
    };

    systemd.services.waydroid-container = {
        wantedBy = [ "multi-user.target" ];
        path = with pkgs; [
          nettools
          iproute2
          iptables
          dnsmasq
        ];
    };
    environment.systemPackages = with pkgs; [
        android-tools
        pkgs.iptables
        pkgs.dnsmasq
        inputs.nur.legacyPackages.${pkgs.system}.repos.ataraxiasjel.waydroid-script
    ];
}
