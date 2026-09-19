''
#!/bin/sh
IMG=$(find /home/verti/Pictures/Wallpapers/ -maxdepth 1 -type f | \
awk '{print $0 "\0icon\x1f" $0}' | \
rofi -dmenu -i -show-icons -theme-str '
  window { width: 90%; }
  listview { layout: horizontal; }
  element { orientation: vertical; padding: 10px; }
  element-icon { size: 256px; }
  element-text { horizontal-align: 0.5; }
')

if [[ -n "$IMG" ]]; then
    awww img $IMG --transition-type random
    echo $IMG > /home/verti/.wallpaper
    notify-send "set wallpaper: $IMG"
fi
''
