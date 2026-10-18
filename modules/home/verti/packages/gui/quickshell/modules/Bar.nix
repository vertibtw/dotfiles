{ theme, ... }:
{
  xdg.configFile."quickshell/modules/Bar.qml".text = ''
    import QtQuick
    import QtQuick.Layouts
    import Quickshell

    PanelWindow {
        id: bar
        anchors {
            top: true
            left: true
            bottom: true
        }
        margins {
            left: 10
            top: 20
            bottom: 20
        }
        implicitWidth: 40
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            color: "${theme.colors.background}"
            radius: 5
            border {
                width: 2
                color: "${theme.colors.background2}"
            }

            // left
            ColumnLayout {
                implicitWidth: parent.width
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    //topMargin: 25
                    topMargin: 10
                }
                Loader {
                    active: true
                    sourceComponent: Menu {}
                    Layout.alignment: Qt.AlignHCenter
                }
                Loader {
                    active: true
                    sourceComponent: Workspaces {}
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            // center
            ColumnLayout {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
                Loader { active: true; sourceComponent: Time {} }
            }

            // right
            ColumnLayout {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: 25
                }
                spacing: 5
                Loader {
                    active: true
                    sourceComponent: Power {}
                    Layout.alignment: Qt.AlignHCenter
                }
                Loader {
                    active: true
                    sourceComponent: Volume {}
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
  '';
}
