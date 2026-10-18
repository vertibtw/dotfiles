{ theme, ... }:
{
  xdg.configFile."quickshell/modules/Workspaces.qml".text = ''
    import QtQuick
    import QtQuick.Layouts
    import Quickshell

    Rectangle {
        anchors {
            top: parent.top
        }

        color: "${theme.colors.background2}"
        width: 25
        height: wsColumn.implicitHeight + 20

        radius: 10

        ColumnLayout {
            id: wsColumn

            anchors.centerIn: parent
            spacing: 5

            Repeater {
                model: niri.workspaces

                Rectangle {
                    visible: index < 10

                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 15
                    Layout.preferredHeight: model.isActive ? 30 : 15

                    Behavior on Layout.preferredHeight {
                        NumberAnimation {
                            duration: 100
                            easing.type: Easing.InOutCubic
                        }
                    }

                    radius: height / 2
                    color: model.isActive ? "${theme.colors.purple}" : "${theme.colors.surface1}"

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor

                        onClicked: niri.focusWorkspaceById(model.id)
                    }
                }
            }
        }
    }
  '';
}
