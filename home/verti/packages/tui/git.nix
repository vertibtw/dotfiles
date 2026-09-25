{ pkgs, theme, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "vertibtw";
        email = "btwverti@gmail.com";
      };

      core = {
        pager = "delta";
      };

      interacitve = {
        diffFilter = "delta --color-only";
      };

      delta = {
        navigate = true;
        side-by-side = true;
        dark = true;

        minus-style = ''black "${theme.colors.red}"'';

        plus-style = ''black "${theme.colors.green}"'';

        line-numbers-minus-style = "${theme.colors.red}";
        line-numbers-plus-style = "${theme.colors.green}";
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
