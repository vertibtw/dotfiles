import qs
import QtQuick

Column {
    id: root

    width: parent ? parent.width : 200
    spacing: parent ? parent.height * 0.015 : 4

    property int fontSize: parent ? Math.round(parent.width * 0.09) : 28

    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
    }

    Text {
        text: Qt.formatDateTime(new Date(), "hh:mm:ss")
        color: Colors.foreground
        font.pixelSize: root.fontSize
        font.weight: Font.Bold
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        text: Qt.formatDateTime(new Date(), "dddd, MMMM d")
        color: Colors.grey
        font.pixelSize: Math.round(root.fontSize * 0.4)
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
