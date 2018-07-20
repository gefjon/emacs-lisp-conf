;;; -*- lexical-binding: t -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(defun org-editing-settings ()
  (turn-on-auto-fill)
  (set-fill-column 80)
  (flyspell-mode))

(use-package org
  :config (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (setf org-log-done 'time)
  (add-hook 'org-mode-hook
            #'org-editing-settings)
  (setf org-agenda-files '("/Users/rowan/todo")))
(provide 'org-settings)
