{ pkgs, inputs, ... }:
let
  patched_dwm = pkgs.dwm.overrideAttrs (old: {
    src = inputs.dwm;
    patches = [
        ./dwm/patches.diff
    ];
    postPatch = "cp -f ${./dwm/config.def.h} config.def.h";
  });
  dwm_autostart = ''
    #!/bin/sh

    statusbar() {
        while true; do
            battery="$(cat /sys/class/power_supply/BAT0/capacity)%"
            status="$(cat /sys/class/power_supply/BAT0/status)"

            case "$status" in
                Charging)    state="c" ;;
                Discharging) state="d" ;;
                *)           state="n" ;;
            esac

            time="$(date '+%H:%M')"

            xsetroot -name "[$state] $battery  | $time"

            sleep 5
        done
    }

    picom &
    flameshot &
    obs --minimize-to-tray &
    blueman-applet &
    vesktop -m &
    feh --bg-fill $(cat /home/verti/.wallpaper) &
    statusbar &
    exec dwm
  '';
  dwm_randomwall = ''
    #!/bin/sh
    echo $(shuf -n1 -e ~/Pictures/Wallpapers/*.{jpg,jpeg,png,webp}) > /home/verti/.wallpaper
    feh --bg-fill $(cat /home/verti/.wallpaper)
  '';
in
{
    home.packages = [
        patched_dwm
    ];

    # TODO: home-manager probably shouldn't manage this
    home.file."/.local/bin/dwm.sh" = {
        text = "${dwm_autostart}";
        executable = true;
    };
    home.file."/.local/bin/dwm_randomwall.sh" = {
        text = "${dwm_randomwall}";
        executable = true;
    };
}
