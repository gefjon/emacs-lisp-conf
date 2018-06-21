;;; -*- lexical-binding: t -*-

(eval-when-compile (require 'utility-fns))

(message-load-file)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(add-hook 'focus-out-hook #'garbage-collect)

(add-to-list 'auto-mode-alist `("\\.rlsp\\'" . lisp-mode))
(add-to-list 'auto-mode-alist `("\\.pbe\\'" . lisp-mode))

(use-package better-defaults)

(fset 'yes-or-no-p 'y-or-n-p)
(add-hook-to-all-major-modes #'delete-selection-mode)

(setq-default indent-tabs-mode nil)
(setf tab-stop-list (number-sequence 2 120 2))

(use-package popup)

(use-package smartparens
  :config (require 'smartparens-config))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common))

(use-package tramp)
(use-package toml-mode)
(use-package flycheck)
(use-package flyspell)
(use-package glsl-mode
  :mode "\\.glsl[fv]*\\'")
(use-package nginx-mode
  :mode "\\.nginx\\'")
(use-package yaml-mode
  :mode "\\.yml\\'")

(eval-and-compile (require 'display-line-numbers))
(add-hook-to-all-major-modes #'display-line-numbers-mode)
(defun configure-display-line-numbers-mode ()
  (setf display-line-numbers-grow-only t
        display-line-numbers-width-start 4
        display-line-numbers-width 4))
(add-hook 'display-line-numbers-mode-hook
          #'configure-display-line-numbers-mode)

(setf inhibit-startup-screen t)
(setf ring-bell-function 'ignore)
(setf visible-bell t)
(menu-bar-mode t)

(define-key lisp-interaction-mode-map (kbd "C-c e") #'eval-print-last-sexp)

(provide 'misc-settings)
