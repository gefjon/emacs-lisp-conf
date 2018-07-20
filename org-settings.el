;;; -*- lexical-binding: t -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package org
  :config (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (setf org-log-done 'time
        org-agenda-files '("/Users/rowan/todo")))
(provide 'org-settings)
