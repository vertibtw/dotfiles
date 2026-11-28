{ inputs, ... }:
{
  home.packages = [ inputs.vbar.packages.x86_64-linux.default ];

  home.file.".vbar.ini".text = ''
    theme = catppuccin mocha
    [bar]
    position = bottom
    thickness = 10

    modules-left = $launcher,workspaces,layout
    modules-center = media
    modules-right = $cpicker,$recorder,battery,volume,systray,clock
    rounding = 0

    ws-indicator-type = id

    [custom.cpicker]
    label = 󰈊
    exec = hyprpicker | wl-copy

    [custom.launcher]
    label = 
    exec = if pgrep -x rofi > /dev/null; then pkill -x rofi; else rofi -show drun ; fi

    [custom.recorder]
    label = 󰑋
    exec = kitty wf-recorder --audio-backend=pipewire --audio /home/verti/r.mp4
  '';
}
