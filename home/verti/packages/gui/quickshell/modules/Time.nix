{ theme, ... }:
{
  xdg.configFile."quickshell/modules/Time.qml".text = ''
    import QtQuick
    import QtQuick.Layouts
    import Quickshell

    Rectangle {
        SystemClock {
            id: clock
            precision: SystemClock.Seconds
        }
        Text {
            id: timeBlock
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            text: Qt.formatDateTime(clock.date, "hh\nmm")
            color: "${theme.colors.text1}"
            font.family: "scientifica"
            font.styleName: "Bold"
            font.pixelSize: 20
            Component.onCompleted: {
                parent.width = timeBlock.contentWidth
            }
        }
    }
  '';
}
