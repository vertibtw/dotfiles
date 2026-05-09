{ pkgs, inputs, ... }:
{
    home.packages = [
        (inputs.qs-git.packages.${pkgs.system}.default.withModules [
            pkgs.qt6.qtdeclarative # for the QtQuick.Layouts
        ])
    ];

}
