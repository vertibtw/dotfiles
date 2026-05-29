{ pkgs, theme, ... }:
{
    programs.emacs = {
        enable = true;
        package = pkgs.emacs30-pgtk;

        # this is really cool, basically nix manages my packages instead of (m)elpa
        extraPackages = epkgs: [
            epkgs.evil
            epkgs.evil-collection
            epkgs.undo-fu
            epkgs.treesit-auto 
            epkgs.treesit-grammars.with-all-grammars
            epkgs.nix-ts-mode
            epkgs.which-key
            epkgs.general
            epkgs.lsp-mode
            epkgs.lsp-ui 
            epkgs.company
            epkgs.vertico
            epkgs.consult
            epkgs.orderless
            epkgs.neotree
            epkgs.ultra-scroll
            epkgs.dashboard
        ];

        extraConfig = ''
            ${theme.emacs}

            (setq use-package-always-ensure nil) ;; just so that the packages are for sure installed from nix

            ;; disabling the annoying stuff (we want minimalist)
	          (menu-bar-mode -1)
      	    (tool-bar-mode -1)
	          (scroll-bar-mode -1)
      	    (fringe-mode 0)
	          (add-to-list 'default-frame-alist '(undecorated . t)) ; this is for wayland specifically
	    
      	    ;; because emacs has weird ahh tab behavior 
	          (setq-default indent-tabs-mode nil)
      	    (setq-default tab-width 2)
	          (setq-default evil-shift-width 2)

      	    ;; qol
            (electric-pair-mode 1)
      	    (electric-indent-mode 1)

            ;; for smooth scrolling
            (setq scroll-step 1)
            (setq scroll-conservatively 10000)
            (setq auto-window-vscroll nil)
            (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
            (setq mouse-wheel-progressive-speed nil)
            (setq mouse-wheel-follow-mouse t)
            (setq scroll-preserve-screen-position t)

            (use-package ultra-scroll ; for touchpad scroll
             :ensure t
             :init
             (ultra-scroll-mode 1))

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

            (use-package treesit-auto
            		  :config
                  (global-treesit-auto-mode))

            (use-package which-key
              :config
                (which-key-mode))

           (use-package lsp-mode
             :hook ((python-ts-mode . lsp)
                      (c-ts-mode . lsp)
                      (c++-ts-mode . lsp)
                      (js-ts-mode . lsp)
                      (nix-mode . lsp))
            :config
              (setq lsp-idle-delay 0.2))

              (use-package lsp-ui
                :hook (lsp-mode . lsp-ui-mode))

           (use-package company
             :hook (lsp-mode . company-mode))

            ;; ths is for fuzzy finding stuff
            (use-package vertico
                :config
                (vertico-mode))

            (use-package orderless
                   :config
                   (setq completion-styles '(orderless basic)))

            (use-package consult)
            (use-package neotree
                :config
                (setq neo-theme 'arrow))

            ;; keybindings
            (with-eval-after-load 'evil
              (evil-set-leader 'normal (kbd "SPC"))
              (evil-define-key 'normal 'global
                  (kbd "<leader>ff") 'consult-find
                  (kbd "<leader>fg") 'consult-grep
                  (kbd "<leader>fs") 'save-buffer
                  (kbd "<leader>e")  'neotree-toggle
                  (kbd "<leader>bb") 'consult-buffer
                  (kbd "<leader>bk") 'kill-buffer
                  (kbd "<leader>wv") 'split-window-right
                  (kbd "<leader>ws") 'split-window-below
                  (kbd "<leader>wk") 'delete-window
                  (kbd "<leader>qq") 'save-buffers-kill-emacs))
            (use-package dashboard
              :config
              (dashboard-setup-startup-hook)
              (setq dashboard-center-content t)
              (setq dashboard-startup-banner 'none)
              (setq dashboard-show-shortcuts nil)
              (setq dashboard-items '((recents . 5))))

              (setq dashboard-startupify-list '(dashboard-insert-newline
                                  dashboard-insert-banner-title
                                  dashboard-insert-items
                                  dashboard-insert-newline
                                  dashboard-insert-footer))

              (setq dashboard-banner-logo-title "${theme.editor-ascii}")
            '';
    };
}