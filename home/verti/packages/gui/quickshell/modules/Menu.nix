{
    xdg.configFile."quickshell/modules/Menu.qml".text = ''
        import Quickshell
        import QtQuick
        import Quickshell.Widgets

        Rectangle {
            id: root
            implicitHeight: logo.height
            implicitWidth: logo.width

            color: "transparent"

            IconImage {
                id: logo
                source: Quickshell.iconPath("nix-snowflake")
                implicitSize: 32
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Quickshell.execDetached(["fuzzel"]);
                }
            }
        }
    '';
}
