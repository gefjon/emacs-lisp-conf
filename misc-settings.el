;;; -*- lexical-binding: t -*-

(declare-function message-load-file "utility-fns" () nil)
(declare-function add-hook-to-all-major-modes "utility-fns" (hook) nil)

(message-load-file)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(use-package hydra
  :demand t)

(add-hook 'focus-out-hook #'garbage-collect)

(add-to-list 'auto-mode-alist `("\\.rlsp\\'" . lisp-mode))
(add-to-list 'auto-mode-alist `("\\.pbe\\'" . lisp-mode))

(global-set-key (kbd "M-<backspace>") 'backward-kill-sexp)
(global-set-key (kbd "M-k") 'kill-sexp)

(defun my-move-beginning-of-line () (interactive)
       "If at the begining of line go to previous line.
 If at the indention go to begining of line.
 Go to indention otherwise."
       (if (bolp) (forward-line -1)
         (skip-chars-backward " \t")
         (unless (bolp) (back-to-indentation))))

(defun my-move-end-of-line () (interactive)
       "If at end of line go to next line.
If at indentation go to end of line.
Go to indentation otherwise"
       (if (eolp) (forward-line 1)
         (let ((old-point (point)))
           (back-to-indentation)
           (when (= old-point (point))
             (move-end-of-line nil)))))

(global-set-key (kbd "C-a") #'my-move-beginning-of-line)
(global-set-key (kbd "C-e") #'my-move-end-of-line)

(global-set-key (kbd "C-c x") #'delete-frame)

(use-package better-defaults)

(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode)

(setq-default indent-tabs-mode nil)
(setf tab-stop-list (number-sequence 2 120 2))

(use-package popup)

(defvar highlight-symbol-highlight-single-occurence)
(use-package highlight-symbol
  :init (setf highlight-symbol-idle-delay 0)
  (setf highlight-symbol-highlight-single-occurence nil)
  :config (add-hook-to-all-major-modes #'highlight-symbol-mode))

(use-package auto-complete
  :config
  (global-auto-complete-mode))

(global-set-key (kbd "M-i") #'auto-complete)

(defhydra hydra-swedish-vowels (:color blue)
  "Swedish vowels"
  ("e" (lambda () (interactive) (insert ?ä)) "ä")
  ("E" (lambda () (interactive) (insert ?Ä)) "Ä")
  ("o" (lambda () (interactive) (insert ?ö)) "ö")
  ("O" (lambda () (interactive) (insert ?Ö)) "Ö")
  ("a" (lambda () (interactive) (insert ?å)) "å")
  ("A" (lambda () (interactive) (insert ?Å)) "Å"))
(global-set-key (kbd "C-c s") 'hydra-swedish-vowels/body)

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
(setf display-line-numbers-grow-only t)
(add-hook-to-all-major-modes #'display-line-numbers-mode)

(setf inhibit-startup-screen t)
(setf ring-bell-function 'ignore)
(setf visible-bell t)
(menu-bar-mode t)

(add-hook 'text-mode-hook
          (lambda ()
            (turn-on-auto-fill)
            (set-fill-column 80)
            (flyspell-mode t)))

(add-hook 'lisp-interaction-mode-hook (lambda () (local-set-key (kbd "C-c e") #'eval-print-last-sexp)))

(provide 'misc-settings)
