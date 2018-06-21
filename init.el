;;; -*- lexical-binding: t -*-

(package-initialize)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(byte-recompile-directory (expand-file-name "~/.emacs.d/lisp") 0)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-interval 4)
  (auto-package-update-maybe))

(require 'utility-fns)

(when (eq system-type 'darwin)
  (require 'mac-system-settings))
(require 'window-settings)
(require 'project-settings)
(require 'lisp-config)
(require 'completion-settings)
(require 'misc-settings)
(require 'ag-settings)
(require 'rust-settings)
(require 'c++-settings)
(require 'python-settings)
(require 'js-settings)
(require 'lua-settings)
(require 'markup-settings)
(require 'keybinding-settings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("147f19ccebab5eb81ce9af9d40446000a3c5d0aab33313550d05d0e5f58d77cb" "62a6731c3400093b092b3837cff1cb7d727a7f53059133f42fcc57846cfa0350" default)))
 '(package-selected-packages
   (quote
    (smartparens counsel-projectile projectile counsel lua-mode auctex slime-company web-mode hydra ag ido-vertical-mode slime sass-mode typescript-mode paredit helm-spotify-plus better-defaults magit smex highlight-symbol use-package column-marker auto-complete racer rust-playground glsl-mode pretty-symbols nginx-mode json-mode pug-mode go-complete go-mode toml-mode flymd markdown-mode markdown-mode+ exec-path-from-shell cargo elpy flycheck flycheck-rust js2-mode rust-mode)))
 '(safe-local-variable-values (quote ((Base . 10) (Syntax . ANSI-Common-Lisp))))
 '(tramp-syntax (quote default) nil (tramp)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :inverse-video nil :weight light :height 120 :width normal :foundry "nil" :family "Input Sans"))))
 '(fixed-pitch ((t (:family "Input Mono"))))
 '(fixed-pitch-serif ((t (:family "Input Mono"))))
 '(highlight-symbol-face ((t (:inherit highlight))))
 '(line-number ((t (:inherit (fixed-pitch shadow default)))))
 '(line-number-current-line ((t (:inherit line-number :background "grey50" :foreground "lavender"))))
 '(linum ((t (:inherit (shadow default) :family "Input Mono"))))
 '(show-paren-match ((t (:inherit highlight))))
 '(variable-pitch ((t (:family "Input Serif")))))

(provide 'init)
