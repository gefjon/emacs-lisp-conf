(fset 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)
(setf tab-stop-list (number-sequence 2 120 2))

(global-auto-complete-mode t)

(use-package column-marker
  :config (add-hook 'latex-mode-hook
                    (lambda (interactive) (column-marker-1 80)))
  :ensure t)

(use-package tramp
  :ensure t)
(use-package toml-mode
  :ensure t)

(setf linum-format "%4d │")
(global-linum-mode t)

(setf inhibit-startup-screen t)
(setf ring-bell-function 'ignore)
(setf visible-bell t)

(provide 'misc-settings)
