(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

(use-package evil)
(evil-mode)

;;(use-package doom-modeline
;;  :ensure t
;;  :init (doom-modeline-mode 1)
;;  :custom ((doom-modeline-height 12)))

(defun lu-funcion()
 (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-l"))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :mode "\\.tsx\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
 (setq typescript-indent-level 1))
  
(setq indent-tabs-mode t)      

(require 'olivetti)
(use-package olivetti
  :ensure t
  :init (olivetti-mode))
(global-set-key (kbd "C-x w") 'olivetti-mode)
(olivetti-set-width 110)
(global-set-key (kbd "C-ä") 'olivetti-shrink)
(global-set-key (kbd "C-ö") 'olivetti-expand)

(global-set-key (kbd "Ä") 'olivetti-shrink)
(global-set-key (kbd "Ö") 'olivetti-expand)

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(global-set-key (kbd "C-x t") 'treemacs)
(global-set-key (kbd "C-x e") 'eval-buffer)

(put 'upcase-region 'disabled nil)
;(set-frame-parameter (selected-frame) 'alpha '(83 .83))
;(add-to-list 'default-frame-alist '(alpha . (83 .83)))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-unset-key (kbd "C-SPC"))

;(require 'fcitx)
;(fcitx-aggressive-setup)

(eval-after-load
  'company
  '(add-to-list 'company-backends #'company-omnisharp))

(defun my-csharp-mode-setup ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)

  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)

  ;csharp-mode README.md recommends this too
  ;(electric-pair-mode 1)       ;; Emacs 24
  ;(electric-pair-local-mode 1) ;; Emacs 25

  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)

(ivy-mode)
(display-line-numbers-mode)
(setq display-line-numbers 'relative)

'(initial-buffer-choice "/home/lu/.emacs.d/start.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "8d412c0ed46b865312d6df5c1dfd1821d349dd3cba00049cf88c4ad34403597e" "3c451787cee570710bff441154a7db8b644cdbb7d270189b2724c6041a262381" "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde" "d537a9d42c6f5349d1716ae9be9a0645cc168f7aff2a8353819d570e5d02c0b3" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "f6a0635dce942dc3101fb3e29198af99ee9341caac22e9c0f739b77ac50f315b" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "f25f174e4e3dbccfcb468b8123454b3c61ba94a7ae0a870905141b050ad94b8f" "2aa073a18b2ba860d24d2cd857bcce34d7107b6967099be646d9c95f53ef3643" "9ee253fcdb48535bf16df2700582b0a11fe99390b018755b941140f2fcdff219" "9ee253fcdb48335bf16df2700582b0a11fe99390b018755b941140f2fcdff219" default))
 '(display-time-mode t)
 '(fringe-mode 6 nil (fringe))
 '(ispell-dictionary nil)
 '(linum-format 'dynamic)
 '(package-selected-packages
   '(nyan-mode color-theme-sanityinc-tomorrow cyberpunk-theme moe-theme gruvbox-theme color-theme-sanityinc-solarized solarized-theme timu-spacegrey-theme twilight-theme cython-mode all-the-icons bongo typescript-mode lsp-mode dracula-theme treemacs magit fcitx omnisharp cherry-blossom-theme theme-magic multiple-cursors exwm gnu-indent indent-tools eshell-vterm evil-better-visual-line vterm lispy org-bullets olivetti ivy doom-modeline evil use-package))
 '(sanityinc-solarized-dark nil)
 '(treemacs-indent-guide-mode t)
 '(warning-suppress-types '((auto-save) (emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 210 :width normal)))))
