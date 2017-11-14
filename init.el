(package-initialize)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'use-package)

(require 'pretty-settings)
(require 'rust-settings)
(require 'slime-config)
(require 'misc-settings)
(require 'js-settings)
(when (eq system-type 'darwin)
  (require 'mac-system-settings))

(custom-set-variables
 '(package-selected-packages
   (quote
    (use-package column-marker auto-complete racer rust-playground glsl-mode pretty-symbols nginx-mode json-mode pug-mode go-complete go-mode toml-mode flymd markdown-mode markdown-mode+ exec-path-from-shell cargo elpy flycheck flycheck-rust js2-mode rust-mode)))
 '(safe-local-variable-values (quote ((Base . 10) (Syntax . ANSI-Common-Lisp)))))

(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Inconsolata")))))

(provide 'init)
