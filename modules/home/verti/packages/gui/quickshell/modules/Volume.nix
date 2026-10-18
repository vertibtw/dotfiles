{ theme, ... }:
{
  xdg.configFile."quickshell/modules/Volume.qml".text = ''
    import QtQuick
    import QtQuick.Controls
    import QtQuick.Layouts
    import Quickshell
    import Quickshell.Services.Pipewire

    Rectangle {
        id: root
        color: "transparent"
        width: 30
        height: volText.height * 1.6

        readonly property PwNode sink: Pipewire.defaultAudioSink
        readonly property bool ready: sink !== null && sink.ready && sink.audio !== null
        readonly property real volume: ready ? sink.audio.volume : 0
        readonly property bool muted: ready ? sink.audio.muted : false

        function setVolume(v: real): void {
            if (!root.ready)
                return
            root.sink.audio.muted = false
            root.sink.audio.volume = Math.max(0, Math.min(1, v))
        }

        // Bind the pipewire node so its volume is tracked and writable.
        PwObjectTracker {
            objects: root.sink !== null ? [root.sink] : []
        }

        Text {
            id: volText
            anchors.centerIn: parent

            //text: root.muted ? "󰝟" : Math.round(root.volume * 100)
            text: {
                if (root.muted || Math.round(root.volume * 100) == 0) {
                    return "󰝟";
                } else if (Math.round(root.volume * 100) < 33) {
                    return "󰕿";
                } else if (Math.round(root.volume * 100) < 66) {
                    return "󰖀";
                } else if (Math.round(root.volume * 100) <= 100) {
                    return "󰕾";
                } else {
                    return "󱄡"; // idk
                }
            }

            color: "${theme.colors.text1}"
            font.family: "scientifica"
            font.styleName: "Bold"
            font.pixelSize: 20
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: popup.visible = !popup.visible
        }

        PopupWindow {
            id: popup
            visible: false
            grabFocus: true

            anchor.item: root
            anchor.edges: Edges.Right | Edges.VCenter
            anchor.gravity: Edges.Right | Edges.VCenter
            anchor.margins.left: 10

            implicitWidth: 50
            implicitHeight: 200
            color: "transparent"

            Rectangle {
                anchors.fill: parent
                color: "${theme.colors.background}"
                radius: 5

                Slider {
                    anchors.centerIn: parent
                    orientation: Qt.Vertical
                    from: 0
                    to: 1
                    stepSize: 0.01
                    value: root.volume
                    onMoved: root.setVolume(value)
                }
            }
        }
    }
  '';
}
