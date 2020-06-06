;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c++-mode))

(setf c-default-style "k&r")

(defun set-c-indent ()
  (setf c-basic-offset 2))

(add-hook 'c-mode-common-hook #'set-c-indent)

(use-package arduino-mode
  :mode (rx "."
            (or "ino" "pde")
            eol))

(provide 'c++-settings)
