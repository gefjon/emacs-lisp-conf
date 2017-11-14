(use-package better-defaults
  :ensure t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)
(setf tab-stop-list (number-sequence 2 120 2))

(global-unset-key (kbd "C-h"))
(global-unset-key (kbd "C-M-h"))

(use-package popup
  :ensure t)
(use-package clippy
  :init (setq clippy-tip-show-function #'clippy-popup-tip-show)
  :bind (("C-h" . clippy-describe-function)
         ("C-M-h" . clippy-describe-variable))
  :ensure t)

(use-package smex
  :config (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . execute-extended-command))
  :ensure t)
  
(use-package column-marker
  :config (add-hook 'latex-mode-hook
                    (lambda (interactive) (column-marker-1 80)))
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
