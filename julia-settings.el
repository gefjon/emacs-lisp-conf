;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package julia-mode
  :mode "\\.jl\\'")

(provide 'julia-settings)
