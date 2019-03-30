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
      reb-re-syntax 'rx)

(add-hook 'focus-out-hook #'garbage-collect)

(add-to-list 'auto-mode-alist `("\\.rlsp\\'" . lisp-mode))
(add-to-list 'auto-mode-alist `("\\.pbe\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.mva\\'" . prog-mode)) ;; Minerva does not yet have an emacs major mode

(fset 'yes-or-no-p 'y-or-n-p)
(add-hook-to-all-modes #'delete-selection-mode)

(use-package dockerfile-mode
  :mode "Dockerfile[^[:space:]]*")

(column-number-mode 1)

;; (use-package llvm-mode
;;   :load-path "")

(setq-default indent-tabs-mode nil)

(use-package popup
  :demand t)

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

(require 'uniquify)
(setf uniquify-buffer-name-style 'forward)

(eval-and-compile (require 'display-line-numbers))
(add-hook-to-all-modes #'display-line-numbers-mode)
(defun configure-display-line-numbers-mode ()
  (setf display-line-numbers-grow-only t
        display-line-numbers-width-start 4
        display-line-numbers-width 4))
(add-hook 'display-line-numbers-mode-hook
          #'configure-display-line-numbers-mode)

(menu-bar-mode t)
(save-place-mode 1)

(define-key lisp-interaction-mode-map (kbd "C-c e") #'eval-print-last-sexp)

(provide 'misc-settings)
