;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package magit
  :demand
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup)))

(provide 'git-settings)
