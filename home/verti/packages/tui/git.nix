{ pkgs, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "vertibtw";
        email = "btwverti@gmail.com";
      };
      alias = {
        st = "status";
        br = "branch";
        ci = "commit -m";
        ca = "commit -am";
        co = "checkout";

        #stolen from https://github.com/isabelroses/dotfiles/blob/main/home/isabel/git.nix
        yolo = ''!git commit -am "$(curl -s https://whatthecommit.com/index.txt)"'';
      };
    };
  };
}
