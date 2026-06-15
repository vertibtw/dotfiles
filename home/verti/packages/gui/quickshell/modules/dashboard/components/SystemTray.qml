import qs
import Quickshell.Services.SystemTray
import QtQuick

Row {
    id: root

    property int iconSize: 18

    spacing: Math.round(iconSize * 0.3)
    layoutDirection: Qt.RightToLeft

    Repeater {
        model: SystemTray.items

        delegate: Item {
            width: root.iconSize
            height: root.iconSize

            Image {
                anchors.fill: parent
                source: model.object.icon
                sourceSize { width: root.iconSize; height: root.iconSize }
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: (mouse) => {
                    if (mouse.button === Qt.RightButton)
                        model.object.contextMenu()
                    else
                        model.object.activate()
                }
            }
        }
    }
}
