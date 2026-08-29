{ pkgs, inputs, ... }:
{
  home.packages = [
    (inputs.qs-git.packages.${pkgs.stdenv.hostPlatform.system}.default.withModules [
      pkgs.qt6.qtdeclarative # for the QtQuick.Layouts
      inputs.qml-niri.packages.${pkgs.stdenv.hostPlatform.system}.default
    ])
  ];

  imports = [
    ./quickshell
  ];

}
