{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      format = ''
        ''${custom}$directory$git_branch$git_status$character
      '';
      directory = {
        truncation_length = 0;
        fish_style_pwd_dir_length = 1;
      };
    };
  };
}
