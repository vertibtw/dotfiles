import qs
import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Controls

PopupWindow {
    id: root
    visible: false

    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

    required property var parentWindow
    property double vol: Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0

    anchor.window: parentWindow

    anchor.rect.x: parentWindow.width 
    anchor.rect.y: parentWindow.height * 1.1  

    implicitWidth: content.width
    implicitHeight: content.height
    grabFocus: true

    Rectangle {
        id: content
        implicitWidth: r.width * 1.1
        implicitHeight: r.height * 1.1

        color: Colors.background

        Row {
            id: r
            spacing: 4
            Text {
                text: {
                    console.log("vol", vol)
                    if (vol === 0) {
                        return ""
                    } else if (vol <= 35) {
                        return "󰕿"
                    } else if (vol <= 65) {
                        return "󰖀"
                    } else if (vol <= 100) {
                        return "󰕾"
                    } else {
                        return "󰖁"
                    }
                }
            }

            Slider {
                id: slider
                from: 0
                to: 100
                value: root.vol
                
                onMoved: {
                    if (Pipewire.defaultAudioSink)
                        Pipewire.defaultAudioSink.audio.volume = value / 100
                }
            }
        }
    }
}