;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))
(setf use-package-always-ensure t)

(message-load-file)

(use-package exec-path-from-shell
  :init (setf exec-path-from-shell-check-startup-files nil)
  :config
  (exec-path-from-shell-copy-envs '("PATH" "LDFLAGS" "INFOPATH" "NVM_DIR" "DEVKITPRO" "DEVKITARM")))

;; use M-<mouse-1> for mouse-2, because mac trackpads are bad
(define-key key-translation-map (kbd "M-<mouse-1>") (kbd "<mouse-2>"))

(setq dired-use-ls-dired nil)

(provide 'mac-system-settings)
