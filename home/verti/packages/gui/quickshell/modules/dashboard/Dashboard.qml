import qs
import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.modules.dashboard.components

PopupWindow {
    id: popup

    required property var parentWindow

    visible: false
    grabFocus: true
    color: "transparent"

    width: parentWindow ? parentWindow.screen.width * 0.18 : 300
    height: parentWindow ? parentWindow.screen.height * 0.30 : 650 // TODO: second value is not correct

    anchor.window: parentWindow
    anchor.rect.x: 4
    anchor.rect.y: parentWindow ? parentWindow.height + 4 : 0

    Rectangle {
        anchors.fill: parent
        color: Colors.mantle
        radius: Math.round(width * 0.04)
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: width * 0.07
        spacing: height * 0.05

        Avatar {
            Layout.alignment: Qt.AlignHCenter
        }

        BigClock {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
        }

        ActionButtons {
            Layout.alignment: Qt.AlignHCenter
        }

        Item { Layout.fillHeight: true }

        SystemTray {
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
