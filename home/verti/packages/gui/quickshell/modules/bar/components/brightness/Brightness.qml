import qs
import Quickshell
import QtQuick

PopupWindow {
    id: popup
    required property var parentWindow
    visible: false
    
    implicitHeight: items.height 
    implicitWidth: items.width 

    anchor.window: parentWindow
    anchor.rect.x: parentWindow.width 
    anchor.rect.y: parentWindow.height * 1.1   

    grabFocus: true

    Column {
        id: items
        spacing: 4
        padding: 4

        Rectangle {
            id: nofilter
            implicitHeight: nf_content.height * 1.2
            implicitWidth: nf_content.width * 1.2

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Quickshell.execDetached([
                        "sh",
                        "-c",
                        `hyprctl eval 'hl.config({ decoration = { screen_shader = "" } })'`
                    ])
                }
            }

            Text {
                id: nf_content
                text: "no filter"
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: grayscale
            implicitHeight: gs_content.height * 1.2
            implicitWidth: gs_content.width * 1.2

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Quickshell.execDetached([
                        "sh",
                        "-c",
                        `hyprctl eval 'hl.config({ decoration = { screen_shader = "/home/verti/dotfiles/home/verti/packages/wm/wayland/hyprland/shaders/grayscale.frag" } })'`
                    ])
                }
            }

            Text {
                id: gs_content
                text: "grayscale"
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: bl_filter // only yuri
            implicitHeight: bl_content.height * 1.2
            implicitWidth: bl_content.width * 1.2

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Quickshell.execDetached([
                        "sh",
                        "-c",
                        `hyprctl eval 'hl.config({ decoration = { screen_shader = "/home/verti/dotfiles/home/verti/packages/wm/wayland/hyprland/shaders/blue_light_filter.frag" } })'`
                    ])
                }
            }

            Text {
                id: bl_content
                text: "blue light filter"
                anchors.centerIn: parent
            }
        }
    }
}