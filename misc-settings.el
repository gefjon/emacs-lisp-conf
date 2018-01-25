(declare-function message-load-file "utility-fns" () nil)
(declare-function add-hook-to-all-major-modes "utility-fns" (hook) nil)

(message-load-file)

(defun my-home () (interactive)
       "If at the begining of line go to begining of buffer.
 If at the indention go to begining of line.
 Go to indention otherwise."
       (if (bolp) (forward-line -1)
         (skip-chars-backward " \t")
         (unless (bolp) (back-to-indentation))))

(global-set-key (kbd "C-a") #'my-home)

(global-set-key (kbd "C-c x") #'delete-frame)

(use-package better-defaults
  :config (ido-mode t))

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)
(setf tab-stop-list (number-sequence 2 120 2))

(use-package popup)

(defvar highlight-symbol-highlight-single-occurence)
(use-package highlight-symbol
  :init (setf highlight-symbol-idle-delay 0)
  (setf highlight-symbol-highlight-single-occurence nil)
  :config (add-hook-to-all-major-modes #'highlight-symbol-mode))

(use-package smex
  :config (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . execute-extended-command)))
  
(use-package column-marker
  :config (add-hook-to-all-major-modes
                    (lambda () (interactive) (column-marker-1 81))))
(use-package auto-complete
  :config
  (global-auto-complete-mode))

(global-set-key (kbd "M-i") #'auto-complete)

(global-set-key (kbd "C-c s e") (lambda () (interactive) (insert ?ä)))
(global-set-key (kbd "C-c s E") (lambda () (interactive) (insert ?Ä)))
(global-set-key (kbd "C-c s o") (lambda () (interactive) (insert ?ö)))
(global-set-key (kbd "C-c s O") (lambda () (interactive) (insert ?Ö)))
(global-set-key (kbd "C-c s a") (lambda () (interactive) (insert ?å)))
(global-set-key (kbd "C-c s A") (lambda () (interactive) (insert ?Å)))
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

(defvar linum-format)
(setf linum-format " %4d │")
(add-hook-to-all-major-modes (lambda () (linum-mode t)))

(setf inhibit-startup-screen t)
(setf ring-bell-function 'ignore)
(setf visible-bell t)
(menu-bar-mode t)

(provide 'misc-settings)
