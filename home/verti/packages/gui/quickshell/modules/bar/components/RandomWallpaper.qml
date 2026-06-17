import qs
import qs.util

import Quickshell
import Quickshell.Hyprland
import QtQuick

Item {
    id: root
    required property var wal

    implicitHeight: btn.height
    implicitWidth: btn.width


    RandomFile {
        id: randomwal
        dir: "/home/verti/Pictures/Wallpapers/"
    }

    Binding {
        target: wal
        property: "src"
        value: randomwal.path
    }

    Rectangle {
        id: btn
        implicitHeight: icon.height
        implicitWidth: icon.width

        color: "transparent"
        
        Text {
            id: icon
            color: Colors.foreground
            font.pixelSize: 15
            text: ""
            MouseArea {
                anchors.fill: parent
                onClicked: (mouse) => {
                    if (mouse.button === Qt.RightButton)
                        randomwal.reroll() // temp 
                    else
                        randomwal.reroll()
                }
            }
        }    
    }
}