;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setf backup-directory-alist (list (cons "." (concat user-emacs-directory
                                                     "backups"))))
(setf require-final-newline t
      apropos-do-all t
      load-prefer-newer t
      visible-bell t
      default-buffer-file-coding-system 'utf-8
      tab-stop-list (number-sequence 2 120 2)
      visible-bell t
      ring-bell-function 'ignore
      inhibit-startup-screen t
      save-place-file (concat user-emacs-directory "places")
      compilation-scroll-output 'first-error
      reb-re-syntax 'rx
      read-quoted-char-radix 16)

(use-package undo-tree
  :bind (("C-/" . undo-tree-undo)
         ("C-?" . undo-tree-redo)
         ("C-x u" . undo-tree-visualize)))

(add-hook 'focus-out-hook #'garbage-collect)

(fset 'yes-or-no-p 'y-or-n-p)
(add-hook-to-all-modes #'delete-selection-mode)

(use-package dockerfile-mode
  :mode "Dockerfile[^[:space:]]*")

(column-number-mode 1)

(setq-default indent-tabs-mode nil)

(use-package tramp)
(use-package toml-mode
  :mode "\\.toml\\'")
(use-package flycheck)
(use-package flyspell)
(use-package glsl-mode
  :mode "\\.glsl[fv]*\\'")
(use-package nginx-mode
  :mode "\\.nginx\\'")
(use-package yaml-mode
  :mode "\\.yml\\'")

(require 'uniquify)
(setf uniquify-buffer-name-style 'forward)

(when (>= emacs-major-version 26)
  (eval-and-compile (require 'display-line-numbers))
  (add-hook-to-all-modes #'display-line-numbers-mode)
  (defun configure-display-line-numbers-mode ()
    (setf display-line-numbers-grow-only t
          display-line-numbers-width-start 4
          display-line-numbers-width 4))
  (add-hook 'display-line-numbers-mode-hook
            #'configure-display-line-numbers-mode))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(save-place-mode 1)

(setf tramp-default-method "ssh")

(define-key lisp-interaction-mode-map (kbd "C-c e") #'eval-print-last-sexp)

(put 'downcase-region 'disabled nil)

(use-package applescript-mode)

(provide 'misc-settings)
