;;; -*- lexical-binding: t -*-

(eval-when-compile (require 'utility-fns))

(message-load-file)

(use-package ido
  :config (ido-mode +1)
  (ido-everywhere +1))

(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode +1)
  (setq magit-completing-read-function 'magit-ido-completing-read)
  (add-to-list 'ido-cr+-function-blacklist 'describe-function)
  (add-to-list 'ido-cr+-function-blacklist 'describe-variable))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode +1)
  (setq ido-vertical-show-count t)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package smex
  :config (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . execute-extended-command)))



(provide 'ido-settings)
