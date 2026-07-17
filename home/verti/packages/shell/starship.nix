{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      format = ''
        ''${custom}$hostname$directory$git_branch$git_status$character
      '';
      directory = {
        truncation_length = 0;
        fish_style_pwd_dir_length = 1;
      };
      custom."user-first-letter" = {
        command = "whoami | cut -c1";
        when = true;
        format = "[$output](bold blue)";
          };
                                          hostname = {
        ssh_only = false;
        format = "@[$hostname](bold yellow) ";
        trim_at = "";
      };
    };
  };
}
