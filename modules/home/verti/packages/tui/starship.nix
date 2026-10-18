# modified from https://github.com/p3rception/dotfiles-p/blob/main/starship.toml
{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 2000;
      format = "$env_var$os$username$hostname$directory$git_branch$git_status\n$character\n";

      character = {
        success_symbol = "╰─➤";
        error_symbol = "╰─➤";
      };

      env_var = {
        symbol = "╭╴";
        variable = "SHELL";
        format = "$symbol";
        disabled = false;
      };

      os = {
        format = "[$symbol](bold white) ";
        disabled = false;
        symbols = {
          NixOS = " ";
          Windows = " ";
        };
      };

      username = {
        style_user = "yellow bold";
        style_root = "black bold";
        format = "[//](#2883ff) [$user](bright-purple) ";
        disabled = false;
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "[at](red) [$hostname](bold blue) ";
        disabled = false;
      };

      directory = {
        truncation_length = 0;
        truncation_symbol = "…/";
        home_symbol = "~";
        read_only = " ";
        format = "[//](#2883ff) [$path]($style)[$read_only]($read_only_style) ";
        style = "#7ed1fb";
      };
    };
  };
}
