{ inputs, ... }:
let
    themes = [
        "https://raw.githubusercontent.com/IloThePyro/NoRoundedCorners/refs/heads/main/No%20Rounded%20Corners.css"
        "https://raw.githubusercontent.com/catppuccin/discord/refs/heads/main/themes/mocha.theme.css"
    ];
in
{
    imports = [ inputs.nixcord.homeModules.nixcord ];

    programs.nixcord = {
        enable = true;
        useGlobalPkgs = false; # otherwise node breaks sometimes
        noMiddleClickPaste.enable = true;

        discord.enable = false;
        goofcord = {
            enable = true;
            clientMod = "equicord";

            autoscroll.enable = true;
            settings = {
                minimizeToTray = true;
                hardwareAcceleration = true;
            };
        };

        config = {
            themeLinks = themes ;
            enabledThemeLinks = themes;
            plugins = {
                silentTyping = {
                    enable = true;
                    chatIcon = true;
                };
                platformIndicators = {
                    enable = true;
                    badges = true;
                    colorMobileIndicator = true;
                };
                messageLogger = {
                    enable = true;
                    ignoreBots = true;
                    collapseDeleted = true;
                };
                shikiCodeblocks = {
                    enable = true;
                    useDevIcon = "COLOR";
                };
                reverseImageSearch.enable = true;
                declutter.enable = true;
                betterGifAltText.enable = true;
                betterGifPicker.enable = true;
                blurNsfw.enable = true;
                consoleJanitor.enable = true;
                fakeNitro.enable = true;
                gifPaste.enable = true;
                imageZoom.enable = true;
                plainFolderIcon.enable = true;
                imageFilename.enable = true;
                messageLatency.enable = true;
            };
        };
    };
}
