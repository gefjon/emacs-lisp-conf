(package-initialize)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(require 'use-package)

(use-package benchmark-init
  :ensure t
  :config
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(byte-recompile-directory (expand-file-name "~/.emacs.d/lisp") 0)

(when (eq system-type 'darwin)
  (require 'mac-system-settings))
(require 'git-settings)
(require 'pretty-settings)
(require 'rust-settings)
(require 'slime-config)
(require 'misc-settings)
(require 'python-settings)
(require 'js-settings)
(require 'tex-settings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (sass-mode typescript-mode paredit helm-spotify-plus better-defaults magit smex highlight-symbol use-package column-marker auto-complete racer rust-playground glsl-mode pretty-symbols nginx-mode json-mode pug-mode go-complete go-mode toml-mode flymd markdown-mode markdown-mode+ exec-path-from-shell cargo elpy flycheck flycheck-rust js2-mode rust-mode)))
 '(safe-local-variable-values (quote ((Base . 10) (Syntax . ANSI-Common-Lisp)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "ivory" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 120 :width normal :foundry "nil" :family "Input Sans"))))
 '(fixed-pitch ((t (:family "Input Mono"))))
 '(fixed-pitch-serif ((t (:family "Input Mono"))))
 '(linum ((t (:inherit (shadow default) :family "Input Mono"))))
 '(variable-pitch ((t (:family "Input Serif")))))

(provide 'init)
