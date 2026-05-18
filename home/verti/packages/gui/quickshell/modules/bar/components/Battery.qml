import qs 
import QtQuick
import Quickshell
import Quickshell.Services.UPower

Item {
    id: root

    implicitWidth: row.width
    implicitHeight: row.height

    property var battery: UPower.displayDevice

    Row {
        id: row
        spacing: 6

        Text {
            text: root.battery.isCharging ? "󰂄" : "󰁹" 
            color: Colors.green 
        }

        Text {
            text: Math.round(root.battery.percentage * 100) + "%"
            color: Colors.foreground
        }
    }
}