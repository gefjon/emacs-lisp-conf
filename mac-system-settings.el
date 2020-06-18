;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-
;; settings loaded only on macos

(use-package exec-path-from-shell
  :config
  (setf exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-copy-envs '("PATH" "LDFLAGS" "INFOPATH"))
  :defer nil)

(setf dired-use-ls-dired nil)

(provide 'mac-system-settings)
