import qs
import QtQuick

Rectangle {
    id: root

    width: parent ? parent.width * 0.35 : 80
    height: width
    radius: width / 2
    color: Colors.background2

    Text {
        anchors.centerIn: parent
        text: ""
        font.pixelSize: parent.width * 0.45
        color: Colors.foreground
    }
}
