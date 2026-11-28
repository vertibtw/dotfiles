// still a WIP, not tested very much
import Quickshell
import Quickshell.Wayland
import QtQuick

import Qt.labs.folderlistmodel

ShellRoot {
    id: shell

    readonly property string desktopDir: Quickshell.env("HOME") + "/Desktop"
    readonly property string targetScreen: ""   // empty => first screen

    function pickScreen() {
        const list = Quickshell.screens;
        for (let i = 0; i < list.length; i++)
            if (targetScreen !== "" && list[i].name === targetScreen) return list[i];
        return list.length > 0 ? list[0] : null;
    }

    function open(path, suffix) {
        Quickshell.execDetached(["xdg-open", path]);
    }

    PanelWindow {
        screen: shell.pickScreen()
        color: "transparent"
        anchors { top: true; bottom: true; left: true; right: true }
        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.namespace: "qs-desktop-icons-thing"
        WlrLayershell.layer: WlrLayer.Bottom
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

        Item {
            id: view
            anchors.fill: parent

            readonly property int cellW: 96
            readonly property int cellH: 104
            readonly property int pad: 20
            readonly property int rows: Math.max(1, Math.floor((height - 2 * pad) / cellH))
            property var selection: ({})

            function cellX(i) { return pad + Math.floor(i / rows) * cellW; }
            function cellY(i) { return pad + (i % rows) * cellH; }

            FolderListModel {
                id: folder
                folder: "file://" + shell.desktopDir
                showDirs: true
                showDirsFirst: true
                showDotAndDotDot: false
                sortCaseSensitive: false
            }

            // the windows-y band thingy it's so cool and satisfying~
            MouseArea {
                id: bg
                anchors.fill: parent
                property point origin
                property var base: ({})

                onPressed: (m) => {
                    origin = Qt.point(m.x, m.y);
                    base = (m.modifiers & Qt.ControlModifier) ? Object.assign({}, view.selection) : ({});
                    view.selection = base;
                    band.x = m.x; band.y = m.y; band.width = 0; band.height = 0;
                    band.visible = true;
                }
                onPositionChanged: (m) => {
                    band.x = Math.min(origin.x, m.x);
                    band.y = Math.min(origin.y, m.y);
                    band.width = Math.abs(m.x - origin.x);
                    band.height = Math.abs(m.y - origin.y);
                    const sel = Object.assign({}, base);
                    for (let i = 0; i < folder.count; i++) {
                        const x0 = view.cellX(i) + 6, y0 = view.cellY(i) + 2;
                        const x1 = x0 + view.cellW - 12, y1 = y0 + view.cellH - 4;
                        if (x0 < band.x + band.width && x1 > band.x && y0 < band.y + band.height && y1 > band.y)
                            sel[folder.get(i, "filePath")] = true;
                    }
                    view.selection = sel;
                }
                onReleased: band.visible = false
            }

            Repeater {
                model: folder
                delegate: Item {
                    id: it
                    required property int index
                    required property string filePath
                    required property string fileName
                    required property url fileUrl
                    required property bool fileIsDir
                    required property string fileSuffix

                    readonly property bool selected: view.selection[filePath] === true
                    readonly property bool isText: shell.textExts.indexOf(fileSuffix.toLowerCase()) >= 0
                    readonly property bool isImage: shell.imageExts.indexOf(fileSuffix.toLowerCase()) >= 0

                    width: view.cellW
                    height: view.cellH
                    x: view.cellX(index)
                    y: view.cellY(index)

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 3
                        radius: 6
                        color: it.selected ? "#55ffffff" : "transparent"
                        border.width: it.selected ? 1 : 0
                        border.color: "#99ffffff"
                    }

                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: 10
                        width: 48
                        height: 48
                        sourceSize: Qt.size(96, 96)
                        fillMode: Image.PreserveAspectFit
                        asynchronous: true
                        source: it.fileIsDir ? Quickshell.iconPath("folder", "inode-directory")
                              : it.isImage ? it.fileUrl
                              : it.isText ? Quickshell.iconPath("text-x-generic", "unknown")
                              : Quickshell.iconPath("application-octet-stream", "unknown")
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: 62
                        width: view.cellW - 10
                        text: it.fileName
                        color: "white"
                        // TODO: make the colors declarative somehow idk
                        style: Text.Outline
                        styleColor: "#cc000000"
                        font.pixelSize: 12
                        wrapMode: Text.Wrap
                        maximumLineCount: 2
                        elide: Text.ElideRight
                        horizontalAlignment: Text.AlignHCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onPressed: (m) => {
                            const s = (m.modifiers & Qt.ControlModifier) ? Object.assign({}, view.selection) : ({});
                            if ((m.modifiers & Qt.ControlModifier) && s[it.filePath]) delete s[it.filePath];
                            else s[it.filePath] = true;
                            view.selection = s;
                        }
                        onDoubleClicked: shell.open(it.filePath, it.fileSuffix)
                    }
                }
            }

            Rectangle {
                id: band
                visible: false
                z: 5
                color: "#33ffffff"
                border.color: "#aaffffff"
                border.width: 1
            }
        }
    }
}
