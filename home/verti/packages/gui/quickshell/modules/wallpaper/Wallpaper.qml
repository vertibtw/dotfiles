import qs
import Quickshell
import Quickshell.Wayland
import QtQuick

Item {
    id: root
    property string src

    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: wallpaper_win
            required property var modelData
            screen: modelData

            anchors {
                left:true
                right:true
                top:true
                bottom:true
            }

            color: "transparent"
            WlrLayershell.layer: WlrLayer.Background

            Image {
                id: wallpaper
                source: root.src
                fillMode: Image.PreserveAspectCrop
                anchors.fill: parent
            }
        }
    }
}