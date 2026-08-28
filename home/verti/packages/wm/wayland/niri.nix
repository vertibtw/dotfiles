{ theme, ... }:
{
    xdg.configFile."niri/config.kdl".text = ''
    input {
        keyboard {
            xkb {
                layout "pl"
            }
            numlock
        }

        touchpad {
             tap
        }

        mouse {
        }

        trackpoint {
        }
        warp-mouse-to-focus
    }

    layout {
        gaps 10
        center-focused-column "never"
        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }

        default-column-width { proportion 0.5; }

        focus-ring { off; }

        border {
            width 1
            active-color "${theme.colors.red}"
            inactive-color "${theme.colors.subtext0}"
            urgent-color "${theme.colors.green}"
        }

        shadow {
            on

            softness 30

            spread 5

            offset x=0 y=5

            color "${theme.colors.background}"
        }
    }

    spawn-at-startup "quickshell"
    spawn-sh-at-startup "vesktop -m"
    spawn-at-startup "blueman-applet"

    hotkey-overlay {
        skip-at-startup
    }

    prefer-no-csd

    animations {
          // TODO
          workspace-switch {
              spring damping-ratio=1.0 stiffness=1000 epsilon=0.0001
          }

          window-open {
              duration-ms 150
              curve "ease-out-expo"
          }

          window-close {
              duration-ms 150
              curve "ease-out-quad"
          }

          horizontal-view-movement {
              spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
          }

          window-movement {
              spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
          }

          window-resize {
              spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
          }

          config-notification-open-close {
              spring damping-ratio=0.6 stiffness=1000 epsilon=0.001
          }

          exit-confirmation-open-close {
              spring damping-ratio=0.6 stiffness=500 epsilon=0.01
          }

          overview-open-close {
              spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
          }

          recent-windows-close {
              spring damping-ratio=1.0 stiffness=800 epsilon=0.001
          }
    }

    binds {
        Super+Shift+Return hotkey-overlay-title="open kitty" { spawn "kitty"; }
        Super+Space hotkey-overlay-title="toggle fuzzel" { spawn-sh "if pgrep -x fuzzel > /dev/null; then pkill -x fuzzel; else fuzzel; fi"; }
        Super+Escape hotkey-overlay-title="lock" { spawn "hyprlock"; }

        XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
        XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
        XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }
        XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
        XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }

        Super+O repeat=false { toggle-overview; }

        Super+Shift+C repeat=false { close-window; }

        Super+Left  { focus-column-left; }
        Super+Down  { focus-window-down; }
        Super+Up    { focus-window-up; }
        Super+Right { focus-column-right; }
        Super+H     { focus-column-left; }
        Super+J     { focus-window-down; }
        Super+K     { focus-window-up; }
        Super+L     { focus-column-right; }

        Super+Shift+Down  { move-window-down; }
        Super+Shift+Up    { move-window-up; }
        Super+Shift+J     { move-window-down; }
        Super+Shift+K     { move-window-up; }

        Super+Home { focus-column-first; }
        Super+End  { focus-column-last; }
        Super+Shift+Home { move-column-to-first; }
        Super+Shift+End  { move-column-to-last; }

        Super+WheelScrollDown            cooldown-ms=100 { focus-workspace-down; }
        Super+WheelScrollUp        cooldown-ms=100 { focus-workspace-up; }
        Super+Shift+WheelScrollDown      { focus-column-right; }
        Super+Shift+WheelScrollUp        { focus-column-left; }

        Super+1 { focus-workspace 1; }
        Super+2 { focus-workspace 2; }
        Super+3 { focus-workspace 3; }
        Super+4 { focus-workspace 4; }
        Super+5 { focus-workspace 5; }
        Super+6 { focus-workspace 6; }
        Super+7 { focus-workspace 7; }
        Super+8 { focus-workspace 8; }
        Super+9 { focus-workspace 9; }
        Super+Shift+1 { move-window-to-workspace 1; }
        Super+Shift+2 { move-window-to-workspace 2; }
        Super+Shift+3 { move-window-to-workspace 3; }
        Super+Shift+4 { move-window-to-workspace 4; }
        Super+Shift+5 { move-window-to-workspace 5; }
        Super+Shift+6 { move-window-to-workspace 6; }
        Super+Shift+7 { move-window-to-workspace 7; }
        Super+Shift+8 { move-window-to-workspace 8; }
        Super+Shift+9 { move-window-to-workspace 9; }

        Super+F { fullscreen-window; }

        Super+V       { toggle-window-floating; }

        Print { screenshot; }
        Ctrl+Print { screenshot-screen; }
        Alt+Print { screenshot-window; }

        Super+Shift+Q { quit; }
        Super+Shift+Escape { power-off-monitors; }
    }
  '';
}
