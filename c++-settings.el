;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c++-mode))

(use-package arduino-mode
  :mode (rx "."
            (or "ino" "pde")
            eol))

(provide 'c++-settings)
