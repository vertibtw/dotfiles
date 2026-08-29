{...}:
{
    imports = [./modules];

    xdg.configFile."quickshell/shell.qml".text = ''
        // whole shell sort of based on https://github.com/imiric/quickshell-niri it's really cool
        import QtQuick
        import QtQuick.Layouts
        import Quickshell
        import Quickshell.Wayland
        import Niri
        import "./modules"

        ShellRoot{
            id: root

            Niri {
                id: niri
                Component.onCompleted: connect()

                onConnected: console.info("Connected to niri")
                onErrorOccurred: function(error) {
                    console.error("Niri error:", error)
                }
            }

            LazyLoader{ active: true; component: Bar{} }
        }

    '';

}
