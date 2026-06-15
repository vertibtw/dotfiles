import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

import qs
import qs.modules.bar.components
import qs.modules.dashboard
import qs.modules.dashboard.components

Variants {
    model: Quickshell.screens
    PanelWindow {
        required property var modelData
        screen: modelData

        id: bar

        visible: States.bar_visible

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: screen.height * 0.02
        color: Colors.background

        Dashboard {
            parentWindow: bar
            visible: dashBtn.popupActive
        }

        Rectangle {
            implicitHeight: rl.implicitHeight 
            implicitWidth: rl.implicitWidth + 20 // +20 for padding

            anchors.left: parent.left
            anchors.leftMargin: 4

            anchors.verticalCenter: parent.verticalCenter

            color: Colors.background2
            radius: Math.max(height, width) / 2
            Row {
                id: rl
                anchors.left: parent.left
                spacing: 6
                anchors.centerIn: parent

                // components
                DashboardButton { id: dashBtn }
                RandomWallpaper {}
                Screenshot {}
                Media {}
                Workspaces {}
            }
        }

        Row {
            spacing: 4
            anchors.centerIn: parent

            // components
            // Workspaces {}
        }

        Rectangle {
            implicitHeight: rr.implicitHeight 
            implicitWidth: rr.implicitWidth + 20 // +20 for padding

            anchors.right: parent.right
            anchors.rightMargin: 4

            anchors.verticalCenter: parent.verticalCenter

            color: Colors.background2
            radius: Math.max(height, width) / 2

            Row {
                id: rr
                spacing: 4
                anchors.centerIn: parent
                Battery {}
                Clock {}
            }
        }
    }
}
