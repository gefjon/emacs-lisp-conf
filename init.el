(package-initialize)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'use-package)

(defvar *hooks-for-global-modes* '(js2-mode-hook
                                   slime-mode-hook
                                   lisp-interaction-mode-hook
                                   emacs-lisp-mode-hook
                                   rust-mode-hook
                                   c-mode-hook
                                   json-mode-hook
                                   pug-mode-hook
                                   nginx-mode-hook
                                   latex-mode-hook
                                   text-mode-hook
                                   markdown-mode-hook))

(defun add-hook-to-all-major-modes (hook)
  (dolist (mode *hooks-for-global-modes*)
    (add-hook mode hook)))

(when (eq system-type 'darwin)
  (require 'mac-system-settings))
(require 'git-settings)
(require 'pretty-settings)
(require 'rust-settings)
(require 'slime-config)
(require 'misc-settings)
(require 'js-settings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (highlight-symbol use-package column-marker auto-complete racer rust-playground glsl-mode pretty-symbols nginx-mode json-mode pug-mode go-complete go-mode toml-mode flymd markdown-mode markdown-mode+ exec-path-from-shell cargo elpy flycheck flycheck-rust js2-mode rust-mode)))
 '(safe-local-variable-values (quote ((Base . 10) (Syntax . ANSI-Common-Lisp)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Inconsolata")))))

(provide 'init)
