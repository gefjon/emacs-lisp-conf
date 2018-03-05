;;; -*- lexical-binding: t -*-

(declare-function message-load-file "utility-fns" () nil)
(declare-function add-hook-to-all-major-modes "utility-fns" (hook) nil)

(message-load-file)

(use-package elpy
  :config (elpy-enable)
  (setq ac-modes (delq 'python-mode ac-modes)
        python-shell-interpreter "python3"))
(provide 'python-settings)
