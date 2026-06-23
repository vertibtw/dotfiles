{ pkgs, ... }:
{
    programs.swappy = {
        enable = true;

        settings = {
            Default = {
                auto_save = false;
                custom_color = "rgb(193, 61, 17)";
                paint_mode = "brush";
                line_size = 5;
                early_exit = false;
                fill_shape = false;
                save_dir = "$HOME/Pictures/Screenshots";
                save_filename_format = "screenshot-%Y%m%d-%H%M%S.png";
                show_panel = false;
                text_font = "sans-serif";
                text_size = 20;
            };
        };
    };
}