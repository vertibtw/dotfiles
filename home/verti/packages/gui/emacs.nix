{ pkgs, ... }:
{
    programs.emacs = {
        enable = true;
        package = pkgs.emacs30-pgtk;

        # this is really cool, basically nix manages my packages instead of (m)elpa
        extraPackages = epkgs: [
            epkgs.evil
            epkgs.evil-collection
            epkgs.undo-fu
        ];

        extraConfig = ''
            (setq use-package-always-ensure nil) ;; just so that the packages are for sure installed from nix

            (use-package evil
              :init
              (setq evil-want-keybinding nil)
              (setq evil-undo-system 'undo-fu)
              :config
              (evil-mode 1))

            (use-package evil-collection
              :after evil
              :config
              (setq evil-want-integration t)
              (evil-collection-init))
            '';
    };
}
