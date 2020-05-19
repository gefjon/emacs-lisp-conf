;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package org
  :config
  (setf org-src-fontify-natively t
        org-log-done 'time
        org-agenda-files (list (expand-file-name "~/sift"))
        org-agenda-start-day "-1d"
        org-agenda-span 16)
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((emacs-lisp . t)
                                 (lisp . t)))
  :bind (("C-c a" . org-agenda)
         ("C-c l" . org-store-link)))
(provide 'org-settings)
