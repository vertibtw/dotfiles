import qs
import Quickshell
import QtQuick

Item {
    id: root

    property bool popupActive: false

    implicitHeight: btn.height
    implicitWidth: btn.width

    Rectangle {
        id: btn
        implicitHeight: icon.height
        implicitWidth: icon.width

        color: "transparent"
        
        Text {
            id: icon
            color: Colors.foreground
            font.pixelSize: 15
            text: "󰋜"
            MouseArea {
                anchors.fill: parent
                onClicked: root.popupActive = !root.popupActive
            }
        }
    }
}
