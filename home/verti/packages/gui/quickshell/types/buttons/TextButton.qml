import qs
import Quickshell
import QtQuick

Item {
    id: root
    required property string content
    required property string exec
    required property bool active

    Rectangle {
        color: root.active ? Colors.light_blue : Colors.background
        height: content.height * 1.3
        width: content.width * 1.4

        Text {
            id: root.content
            color: root.active ? Colors.foreground: Colors.background
            text: content
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                Quickshell.execDetached([
                    "sh",
                    "-c",
                    root.exec
                ])                 
            }
        }
    }
}