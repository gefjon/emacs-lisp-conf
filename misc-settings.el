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

(use-package better-defaults
  :ensure t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)
(setf tab-stop-list (number-sequence 2 120 2))

(use-package popup
  :ensure t)

(use-package highlight-symbol
  :init (setf highlight-symbol-idle-delay 0)
  (setf highlight-symbol-highlight-single-occurence nil)
  :config (add-hook-to-all-major-modes #'highlight-symbol-mode)
  :ensure t)

(use-package smex
  :config (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . execute-extended-command))
  :ensure t)
  
(use-package column-marker
  :config (add-hook-to-all-major-modes
                    (lambda () (interactive) (column-marker-1 80)))
  :ensure t)
(use-package auto-complete
  :config (global-auto-complete-mode t)
  :ensure t)
(use-package tramp
  :ensure t)
(use-package toml-mode
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package flyspell
  :ensure t)
(use-package glsl-mode
  :mode "\\.glsl[fv]*\\'")
(use-package nginx-mode
  :mode "\\.nginx\\'")

(setf linum-format "%4d │")
(global-linum-mode t)

(setf inhibit-startup-screen t)
(setf ring-bell-function 'ignore)
(setf visible-bell t)

(provide 'misc-settings)
