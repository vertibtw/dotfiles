# needed for vbar, because I do not want to write my own watcher (skill issue)
{ pkgs, inputs, ... }:
let
  sni-watcher = pkgs.stdenv.mkDerivation {
    pname = "gdbus-sni-watcher";
    version = "unstable";
    src = inputs.sni-watcher;
    nativeBuildInputs = [ pkgs.pkg-config ];
    buildInputs = [ pkgs.glib ];
    buildPhase = "gcc -o sni-watcher gdbus_watcher.c $(pkg-config --cflags --libs gio-2.0)";
    installPhase = "install -Dm755 sni-watcher $out/bin/sni-watcher";
  };
in
{
  systemd.user.services.sni-watcher = {
    description = "StatusNotifierWatcher";
    after = [ "graphical-session-pre.target" ];
    wantedBy = [ "graphical-session-pre.target" ];
    serviceConfig = {
      ExecStart = "${sni-watcher}/bin/sni-watcher";
      Restart = "always";
    };
  };
}
