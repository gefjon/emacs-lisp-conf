(message "Found system-type %s, sourcing mac-system-settings" system-type)

(use-package exec-path-from-shell
  :init (setf exec-path-from-shell-check-startup-files nil)
  :config (progn (exec-path-from-shell-initialize)
                 (exec-path-from-shell-copy-env "INFOPATH"))
  :ensure t)

;; use cmd-mouse for mouse-2, because mac trackpads are bad
(define-key key-translation-map (kbd "<s-mouse-1>") (kbd "<mouse-2>"))

(setq dired-use-ls-dired nil)

(menu-bar-mode t)

(provide 'mac-system-settings)
