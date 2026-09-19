import os
import time
import socket
import subprocess

xdg_runtime = os.environ.get("XDG_RUNTIME_DIR")
instance = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE")
socket_path = f"{xdg_runtime}/hypr/{instance}/.socket2.sock"
bar_open = False

s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
s.connect(socket_path)

with s.makefile("r", encoding="utf-8") as f:
    for line in f:
        line = line.strip()
        if not line:
            continue

        event, _, args = line.partition(">>")

        if event == "openlayer" and args == "v.bar":
            bar_open = True
            subprocess.Popen(["dunstctl", "close-all"])
            print("bar_open")
        elif event == "closelayer" and args == "v.bar":
            bar_open = False
            print("bar_close")
        elif event == "workspacev2" and not bar_open:
            workspace_id, workspace_name = args.split(",", 1)

            subprocess.Popen(["dunstctl", "close-all"])
            time.sleep(0.05)
            subprocess.Popen(
                ["notify-send", f"ID: {workspace_id}"]
            )

            print(f"ws id: {workspace_id}, ws name: {workspace_name}")
