;;; -*- lexical-binding: t -*-

(eval-when-compile (require 'utility-fns))

(message-load-file)

(use-package elpy
  :config (elpy-enable)
  (setq python-shell-interpreter "python3"))
(provide 'python-settings)
