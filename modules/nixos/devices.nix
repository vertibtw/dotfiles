{
    # tablet
    services.udev.extraRules = ''
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="037b", MODE="0660", GROUP="input"
    '';
}
