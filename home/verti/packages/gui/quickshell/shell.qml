//@ pragma UseQApplication
import Quickshell
import QtQuick

import qs.modules.bar
import qs.modules.wallpaper

ShellRoot {
    Wallpaper {id: wall}
    Bar {wallpapermod: wall}
}