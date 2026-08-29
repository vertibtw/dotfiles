{ theme, ... }:
{
    xdg.configFile."quickshell/modules/Power.qml".text = ''
        import QtQuick
        import QtQuick.Layouts
        import Quickshell
        import Quickshell.Services.UPower

        Rectangle {
            color: "${theme.colors.gray}"
            radius: width / 4

            Rectangle {
                id: visualPercentage
                color: {
                    if (Math.round(UPower.displayDevice?.percentage * 100)<= 20) {
                        return "${theme.colors.red}";
                    } else if (UPower.displayDevice?.state == UPowerDeviceState.Charging) {
                        return "${theme.colors.green}";
                    } else {
                        return "${theme.colors.text1}";
                    }
                }
                radius: parent.radius
                height: parent.height
                width: parent.width * (UPower.displayDevice?.percentage ?? 0)
            }

            Text {
                id: percentage
                text: (UPower.displayDevice?.state == UPowerDeviceState.Charging ? "󱐋" : "") + Math.round((UPower.displayDevice?.percentage ?? 0) * 100)
                anchors.centerIn: parent
                font {
                    family: "scientifica"
                    styleName: "Bold"
                    pixelSize: 13
                }
                color: "${theme.colors.background}";

                // doesn't size correctly on startup without this
                Component.onCompleted: {
                    parent.width = percentage.contentWidth * 1.7
                    parent.height = percentage.contentHeight * 1.01
                }
                onContentWidthChanged: parent.implicitWidth = percentage.contentWidth * 1.9
                onContentHeightChanged: parent.implicitHeight = percentage.contentHeight * 1.01
            }
        }
    '';
}
