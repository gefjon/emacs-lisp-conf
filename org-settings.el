;;; -*- lexical-binding: t -*-

(eval-when-compile (require 'utility-fns))

(message-load-file)

(use-package org
  :config (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (setf org-log-done 'time)
  (add-hook 'org-mode-hook
            (lambda ()
              (turn-on-auto-fill)
              (set-fill-column 80)
              (flyspell-mode t)))
  (setf org-agenda-files '("/Users/rowan/todo")))
(provide 'org-settings)
