import qs
import Quickshell
import QtQuick
import QtQuick.Layouts

GridLayout {
    id: root

    columns: 2
    columnSpacing: 8
    rowSpacing: 8

    property int btnSize: parent ? Math.round(parent.width * 0.22) : 44
    property int iconSize: Math.round(btnSize * 0.4)

    Row {
        spacing: 4
        Repeater {
            model: [
                { icon: "\uF1C3", color: Colors.yellow, cmd: "systemctl suspend" },
                { icon: "\uF1C0", color: Colors.red, cmd: "loginctl terminate-user $(whoami)" },
                { icon: "\uF070", color: Colors.teal, cmd: "systemctl reboot" },
                { icon: "\uF011", color: Colors.red, cmd: "systemctl poweroff" },
            ]

            delegate: Rectangle {
                required property var modelData

                width: root.btnSize
                height: root.btnSize
                radius: width * 0.25
                color: modelData.color
                Layout.alignment: Qt.AlignHCenter

                Text {
                    anchors.centerIn: parent
                    text: modelData.icon
                    color: Colors.background
                    font.pixelSize: root.iconSize
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Quickshell.execDetached(["sh", "-c", modelData.cmd])
                }
            }
        }
    }
}
