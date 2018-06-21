;;; -*- lexical-binding: t -*-

(eval-when-compile (require 'utility-fns))

(message-load-file)

(use-package lua-mode
  :mode "\\.lua\\'"
  :config
  (setf lua-indent-level 2))

(provide 'lua-settings)
