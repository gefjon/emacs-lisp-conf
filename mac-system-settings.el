(use-package exec-path-from-shell
  :config (progn (exec-path-from-shell-initialize)
                 (exec-path-from-shell-copy-env "INFOPATH"))
  :ensure t)

;; use cmd-mouse for mouse-2, because mac trackpads are bad
(define-key key-translation-map (kbd "<s-mouse-1>") (kbd "<mouse-2>"))

(setq dired-use-ls-dired nil)

(provide 'mac-system-settings)
