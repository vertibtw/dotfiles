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
            hs = ''
              log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all
          '';
            #stolen from someone idk
            yolo = ''!git commit -am "$(curl -s https://whatthecommit.com/index.txt)"'';
        };
    };
  };
}
