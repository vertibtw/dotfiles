import qs
import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Item {
    id: root

    property var player: Mpris.players.values.find(p => p.playbackState === MprisPlaybackState.Playing)
                         ?? Mpris.players.values[0]
                         ?? null

    implicitWidth: mediarow.width
    implicitHeight: mediarow.height

    Row {
        id: mediarow
        spacing: 6
        visible: root.player !== null

        Text {
            text: root.player?.playbackState === MprisPlaybackState.Playing ? "⏸" : "▶"
            color: Colors.light_blue

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.player.togglePlaying()
                }
            }
        }

        Text {
            text: root.player?.trackTitle ?? "Unknown Title"
            color: Colors.foreground
        }
    }
}
